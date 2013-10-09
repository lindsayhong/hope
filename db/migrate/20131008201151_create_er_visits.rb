class CreateErVisits < ActiveRecord::Migration
  def change
    create_table :er_visits do |t|
      t.integer :intervention_id
      t.date :er_date
      t.string :er_icd9_code
      t.string :er_icd9_detail
      t.integer :er_cost
      t.text :er_notes

      t.timestamps
    end
  end
end
