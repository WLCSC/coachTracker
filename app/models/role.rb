class Role < ActiveRecord::Base
	belongs_to :category
	belongs_to :sport
end
