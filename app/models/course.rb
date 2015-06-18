class Course < ActiveRecord::Base
	has_many :certifications, dependent: :destroy
	validates :name, presence: true, uniqueness: true

end
