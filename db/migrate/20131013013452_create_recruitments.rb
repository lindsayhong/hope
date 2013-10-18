class CreateRecruitments < ActiveRecord::Migration
  def change
    create_table :recruitments do |t|
      t.integer :recruit_id
      t.date :review_date
      t.string :account_number
      t.date :admission_date
      t.integer :past_er_visits
      t.integer :past_hosp_visits
      t.text :reason_admitted
      t.integer :age
      t.integer :eject_frac
      t.decimal :serum_albumin

      t.timestamps
    end
  end
end
