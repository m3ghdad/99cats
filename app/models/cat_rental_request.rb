# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  STATS = %w(PENDING APPROVED DENIED).freeze

  validates :status, inclusion: STATS
  validates :start_date, :end_date, :status, presence: true
  validates :does_not_overlap_approved_request

  after_initialize :assign_pending_status

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    dependent: :destroy,
    class_name: 'Cat'

    private
    def assign_pending_status
      self.status ||= 'PENDING'
    end

    def overlapping_requests
      CatRentalRequest
        .where.not(id: self.id)
        .where(cat_id: cat_id)
        .where.not('start_date > :end_date OR end_date < :start_date',
          start_date: start_date, end_date: end_date)
    end

    def overlapping_approved_requests
      overlapping_requests.where('status = \'APPROVED\'')
    end

    def does_not_overlap_approved_request
    return if self.denied?

    unless overlapping_approved_requests.empty?
      errors[:base] <<
        'Cannot approve request'
    end
  end

end
