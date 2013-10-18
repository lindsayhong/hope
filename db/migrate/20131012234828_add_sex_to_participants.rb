class AddSexToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :sex, :string
  end
end
