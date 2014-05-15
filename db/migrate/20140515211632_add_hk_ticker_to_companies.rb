class AddHkTickerToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :hk_ticker, :integer
  end
end
