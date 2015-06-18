class Person < ActiveRecord::Base
	has_many :certifications
	has_many :positions

	validates :name, presence: true, uniqueness: true

	def certified?
		cy = Date.today.year
		cy -= 1 if Date.today.month < 6

		if certifications.where(year_id: (cy-5)...cy+1).count >= 4
			true
		elsif certifications.where(year_id: (cy-3)...cy+1).count >= 2
			true
		else
			false
		end
	end
end
