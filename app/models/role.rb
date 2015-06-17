class Role < ActiveRecord::Base
	belongs_to :category
	belongs_to :sport
	has_many :positions
end
