class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :company_name
      t.string :ticker
      t.date :date
      t.time :time
      t.text :message
      t.string :url

      t.timestamps
    end
  end
end
