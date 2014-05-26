class AddIDstoAssignments < ActiveRecord::Migration
  def change
  	add_column :assignments, :user_id, :integer
  	add_column :assignments, :company_id, :integer
  	add_index :assignments, :user_id
  	add_index :assignments, :company_id
  end
end
