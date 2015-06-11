class Position < ActiveRecord::Base
	belongs_to :person
	belongs_to :role
	belongs_to :sport
	belongs_to :year

	def category
		role.category if role
	end
end
