class Sport < ActiveRecord::Base
	has_many :positions, through: :roles
	has_many :roles, dependent: :destroy
end
