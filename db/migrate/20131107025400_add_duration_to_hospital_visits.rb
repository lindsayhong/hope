class AddDurationToHospitalVisits < ActiveRecord::Migration
  def change
  	add_column :hospital_visits, :hospital_visit_duration, :integer
  end
end
