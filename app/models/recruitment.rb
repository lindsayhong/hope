class Recruitment < ActiveRecord::Base
	belongs_to :recruit
	has_many :interventions
	has_many :hospital_visits, through: :interventions
	has_many :er_visits, through: :interventions
end
