class AnnouncementsMailer < ActionMailer::Base
	default from: "alert@hkequiti.es"

	# Subject can be set in your I18n file at config/locales/en.yml
	# with the following lookup:
	#
	#   en.announcements_mailer.announcement_alert.subject
	#
	def announcement_alert(annc)
		@annc = annc
		@users = annc.users

		# Send all the announcements parsed into an email to each user's email

		mail to: "johnheroy@gmail.com"
	end
end
