class Year < ActiveRecord::Base
	has_many :certifications
	has_many :positions
end
