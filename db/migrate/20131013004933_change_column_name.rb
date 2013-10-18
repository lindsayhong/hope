class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :interventions, :participant_id, :recruit_id
  end
end
