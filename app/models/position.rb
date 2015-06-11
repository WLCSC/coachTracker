class Position < ActiveRecord::Base
	belongs_to :year
	belongs_to :role
	belongs_to :person
	belongs_to :sport
end
