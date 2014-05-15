class AddDateTimeToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :datetime, :datetime
  end
end
