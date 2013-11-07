class Recruit < ActiveRecord::Base
	has_many :recruitments
	has_many :interventions #, through :recruitments
	has_many :hospital_visits #, through :interventions

  # validates_length_of :medical_record_number, :is => 12.
  	# :message => "MRN should have 12 characters"

end
