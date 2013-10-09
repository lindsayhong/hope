class Participant < ActiveRecord::Base
	has_many :interventions
	has_many :hospital_visits

  # validates_length_of :medical_record_number, :is => 12.
  	# :message => "MRN should have 12 characters"

end
