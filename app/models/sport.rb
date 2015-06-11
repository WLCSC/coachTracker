class Sport < ActiveRecord::Base
	has_many :positions
	has_many :roles
end
