class AddCompanyIDtoAnnouncements < ActiveRecord::Migration
  def change
  	add_column :announcements, :company_id, :integer
  	remove_column :announcements, :company_name, :string
  	remove_column :announcements, :ticker, :string
  end
end
