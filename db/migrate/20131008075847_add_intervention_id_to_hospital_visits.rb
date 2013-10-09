class AddInterventionIdToHospitalVisits < ActiveRecord::Migration
  def change
    add_column :hospital_visits, :intervention_id, :integer
  end
end
