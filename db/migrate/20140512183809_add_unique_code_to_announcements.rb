class AddUniqueCodeToAnnouncements < ActiveRecord::Migration
  def change
  	add_column :announcements, :unique_code, :string
  end
end
