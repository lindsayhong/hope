class ChangeAgeColumnInRecruitment < ActiveRecord::Migration
  def change
  	rename_column(:recruitments, :age, :recruitment_age)
  end
end
