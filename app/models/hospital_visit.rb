class HospitalVisit < ActiveRecord::Base
	belongs_to :recruit
	belongs_to :intervention
end
