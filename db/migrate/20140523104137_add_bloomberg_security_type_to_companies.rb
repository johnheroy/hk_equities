class AddBloombergSecurityTypeToCompanies < ActiveRecord::Migration
  def change
  	add_column :companies, :bloomberg_security_type, :string
  end
end
