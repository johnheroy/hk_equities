class AnnouncementsController < ApplicationController
	def show_latest_ten
		@announcements = Announcement.order("datetime desc").limit(10)
	end
end
