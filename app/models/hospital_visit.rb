class HospitalVisit < ActiveRecord::Base
	belongs_to :intervention
	before_save :calculate_duration

	def calculate_duration
		self.hospital_visit_duration = (self.discharge_date - self.admission_date).to_i
    # hospital_visit = HospitalVisit.find(self.id)
    # write_attribute(:hospital_visit_duration, (hospital_visit.discharge_date - hospital_visit.admission_date).to_i)
    # self.save
  end
end
