class AddIndicesToTickerInCompanies < ActiveRecord::Migration
  def change
  	add_index :companies, :ticker
  	add_index :companies, :hk_ticker
  end
end
