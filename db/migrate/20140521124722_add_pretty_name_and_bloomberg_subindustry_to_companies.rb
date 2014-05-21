class AddPrettyNameAndBloombergSubindustryToCompanies < ActiveRecord::Migration
  def change
  	add_column :companies, :pretty_name, :string
  	add_column :companies, :bloomberg_subindustry, :string
  end
end
