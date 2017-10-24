# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord

	CAT_COLORS = %w(black white brown).freeze
# def choose_color
# 	one_color = []
# 	CAT_COLORS.each do |color|
# 		one_color << color unless one_color.include?(color)
# 	end
# 	one_color
# end

	validates :color, inclusion: CAT_COLORS
	validates :sex, inclusion: %w(M F)
	validates :birth_date, :color, :name, :sex, :description, presence: true

	def age
		# now = Date.today
		# (self.birth_date.year) - now.year
		time_ago_in_words(birth_date)
	end
end
