class CatRentalRequest < ApplicationRecord
  STATS = %w(PENDING APPROVED DENIED).freeze

  validates :status, inclusion: STATS
  validates :start_date, :end_date, :status, presence: true

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

end
