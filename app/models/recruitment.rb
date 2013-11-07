class Recruitment < ActiveRecord::Base
	belongs_to :recruit
	has_many :interventions
end
