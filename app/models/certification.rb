class Certification < ActiveRecord::Base
	belongs_to :course
	belongs_to :year
	belongs_to :person
end
