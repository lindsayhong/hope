class AddMiddleInitialToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :middle_initial, :string
  end
end
