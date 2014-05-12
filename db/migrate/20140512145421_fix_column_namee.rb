class FixColumnNamee < ActiveRecord::Migration
  def change
  	rename_column :companies, :company_name, :name
  end
end
