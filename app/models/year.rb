class Year < ActiveRecord::Base
	has_many :certifications
	has_many :positions

	def name
		id.to_s + '-' + (id+1).to_s
	end
end
