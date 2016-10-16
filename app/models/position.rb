class TimeLimitValidator < ActiveModel::Validator
	def validate position
                year = position.year
		if (position.role.fte - position.role.positions.where(year: year).sum(:fte) - (position.id ? 0 : position.fte )) < -0.1
			position.errors[:fte] << "is too high. #{(position.role.positions.where(year: year).sum(:fte))}"
		end
	end
end

class Position < ActiveRecord::Base
	belongs_to :person
	belongs_to :role
	belongs_to :year

	validates_associated :person
	validates_associated :role

	validates :experience, presence: true
	validates :fte, presence: true

	validates_with TimeLimitValidator

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
        when -100
            "n/a"
		else
			experience
		end
	end
end
