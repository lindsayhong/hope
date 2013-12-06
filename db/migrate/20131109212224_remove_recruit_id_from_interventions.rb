class RemoveRecruitIdFromInterventions < ActiveRecord::Migration
  def change
  	remove_column :interventions, :recruit_id
  end
end
