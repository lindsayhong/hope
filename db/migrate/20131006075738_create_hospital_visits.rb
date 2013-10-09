class CreateHospitalVisits < ActiveRecord::Migration
  def change
    create_table :hospital_visits do |t|
      t.date :admission_date
      t.date :discharge_date
      t.string :icd9_code
      t.text :icd9_detail
      t.decimal :cost

      t.timestamps
    end
  end
end
