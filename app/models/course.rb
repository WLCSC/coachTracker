class Course < ActiveRecord::Base
	has_many :certifications
end
