class Certification < ActiveRecord::Base
	belongs_to :course
	belongs_to :person
	belongs_to :year

	validates_associated :course
	validates_associated :person
	validates_associated :year
end
