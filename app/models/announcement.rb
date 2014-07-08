class Announcement < ActiveRecord::Base
	belongs_to :company
	validates :unique_code, uniqueness: true

	after_save :send_notifications

	scope :latest_ten, order("datetime desc")
	scope :recent, order("created_at desc").limit(3)

	def send_notifications
		users = self.company.users
		users.each do |user|
			AnnouncementsMailer.alert(self, user).deliver
		end
	end

end
