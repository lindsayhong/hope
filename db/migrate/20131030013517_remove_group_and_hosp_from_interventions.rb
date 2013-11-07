class RemoveGroupAndHospFromInterventions < ActiveRecord::Migration
  def change
  	remove_column :interventions, :group
  	remove_column :interventions, :previous_hospitalizations
  end
end
