class Sport < ActiveRecord::Base
	belongs_to :role
	has_many :positions
end
