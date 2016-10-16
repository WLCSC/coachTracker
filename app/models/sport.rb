class Sport < ActiveRecord::Base
	has_many :positions, through: :roles
	has_many :roles, dependent: :destroy
	belongs_to :season

	validates :name, presence: true, uniqueness: true
	validates :short, presence: true
	validates :start_date, presence: true
	validates :end_date, presence: true
	validates :season, presence: true


    def short_name
        "#{season ? season.name[0] : "X"}-#{short}#{group && group.present? ? '-' + group : ''}"
    end
end
