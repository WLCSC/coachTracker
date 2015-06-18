class Category < ActiveRecord::Base
	has_many :roles
	validates :name, presence: true, uniqueness: true
	validates :pay, presence: true
end
