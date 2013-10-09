class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :first_name
      t.string :last_name
      t.string :medical_record_number
      t.date :date_of_birth

      t.timestamps
    end
  end
end
