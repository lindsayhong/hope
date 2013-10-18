class AddParticipantToRecruits < ActiveRecord::Migration
  def change
    add_column :recruits, :participant, :boolean
  end
end
