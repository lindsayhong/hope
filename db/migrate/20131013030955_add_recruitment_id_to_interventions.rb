class AddRecruitmentIdToInterventions < ActiveRecord::Migration
  def change
    add_column :interventions, :recruitment_id, :integer
  end
end
