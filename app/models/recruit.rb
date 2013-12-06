class Recruit < ActiveRecord::Base
	has_many :recruitments
	has_many :interventions, through: :recruitments
	has_many :hospital_visits, through: :interventions
	has_many :er_visits, through: :interventions

  # validates :medical_record_number, length: {is: 12}
  	

end
