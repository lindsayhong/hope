class AddGroupToRecruitments < ActiveRecord::Migration
  def change
  	add_column :recruitments, :group, :string
  end
end
