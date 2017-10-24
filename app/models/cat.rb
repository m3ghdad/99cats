class Cat < ApplicationRecord

	CAT_COLORS = %w(black white brown)

	validates :color, inclusion: CAT_COLORS
	validates :sex, inclusion: %w(M F)
	validates :birth_date, :color, :name, :sex, :description, presence: true

	def age
		# now = Date.today
		# (self.birth_date.year) - now.year 
		time_ago_in_words(birth_date)
	end
end