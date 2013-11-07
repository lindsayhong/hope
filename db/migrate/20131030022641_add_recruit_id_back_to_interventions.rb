class AddRecruitIdBackToInterventions < ActiveRecord::Migration
  def change
  	add_column :interventions, :recruit_id, :integer
  end
end
