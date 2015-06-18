class Role < ActiveRecord::Base
	belongs_to :category
	belongs_to :sport
	has_many :positions

	validates_associated :sport
	validates_associated :category

	validates :name, presence: true
	validates :fte, presence: true

	class << self
		def open_positions me=nil
			self.all.to_a.keep_if{|r| r.positions.map{|p| p.person}.include?(me) || (r.fte - r.positions.sum(:fte) > 0.0099)}
		end
	end
end
