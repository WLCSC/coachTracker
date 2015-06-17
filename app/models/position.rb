class Position < ActiveRecord::Base
	belongs_to :person
	belongs_to :role
	belongs_to :year

	def category
		role.category if role
	end

	def sport
		role.sport
	end

	def exp
		case experience
		when -1
			"T"
		when 10
			"9+"
		else
			experience
		end
	end
end
