class AnnouncementsMailer < ActionMailer::Base
	default from: "alert@hkequiti.es"

	# Subject can be set in your I18n file at config/locales/en.yml
	# with the following lookup:
	#
	#   en.announcements_mailer.announcement_alert.subject
	#
	def alert(annc)
		#@annc = annc
		#@users = @annc.users

		# Send all the announcements parsed into an email to each user's email
		#@users.each do |user|
		#	mail to: user.email, subject: "HK Equities Alert (#{@annc.hk_ticker})"
		#end
	end
end
