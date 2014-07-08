class AnnouncementsMailer < ActionMailer::Base
	default from: "alert@hkequiti.es"

	# Subject can be set in your I18n file at config/locales/en.yml
	# with the following lookup:
	#
	#   en.announcements_mailer.announcement_alert.subject
	#
	def alert(annc, user)
		@annc = annc
		@greeting = annc.company.name.upcase + " (#{annc.company.hk_ticker}) has posted an announcement at #{annc.datetime.to_formatted_s(:short)}: #{message}."

		mail to: user.email, subject: "HK Equities Alert (#{annc.company.hk_ticker})"
	end
end
