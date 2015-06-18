class Sport < ActiveRecord::Base
	has_many :positions, through: :roles
	has_many :roles, dependent: :destroy

	validates :name, presence: true, uniqueness: true
	validates :short, presence: true, uniqueness: true
	validates :start_date, presence: true
	validates :end_date, presence: true
end
