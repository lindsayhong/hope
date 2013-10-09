class AddParticipantIdToInterventions < ActiveRecord::Migration
  def change
    add_column :interventions, :participant_id, :integer
  end
end
