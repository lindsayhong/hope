class ChangeParticipantsToRecruits < ActiveRecord::Migration
  def self.up
    rename_table :participants, :recruits
  end

  def self.down
    rename_table :recruits, :participants
  end
end
