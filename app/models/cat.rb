class Cat < ApplicationRecord
	validates :color, inclusion: { in: %w(black white brown)}
	validates :sex, inclusion: { in: %w(M F)}
	validates :birth_date, :color, :name, :sex, :description, presence: true

	def age
		now = Date.today
		(self.birth_date.year) - now.year 
	end
end