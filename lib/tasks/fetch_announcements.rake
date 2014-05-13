desc "Fetch latest announcements from the HKEx website"

task :fetch_announcements => :environment do
	require 'nokogiri'
	require 'open-uri'

	def process_announcement(announcement)
		raw_text = announcement.text

		date = raw_text[0,10] # => DD/MM/YYYY
		time = raw_text[10, 5] # => HH:MM
		ticker = raw_text[15, 5].to_i.to_s + ".HK"
		name = announcement.css("td nobr").text.split(" ").map {|word| word.capitalize}.join(" ")
		document_name = announcement.css("a.news").text.split(" ").map {|word| word.capitalize}.join(" ")
		
		coy = Company.new(name: name, ticker: ticker)
		if !coy.save # if company is already in database
			coy = Company.where(ticker: ticker)
		end
		Announcement.create(date: date, 
							time: time, 
							message: document_name, 
							company: coy, 
							unique_code: (date + time + document_name + coy.name + coy.ticker))
	end

	puts "Fetching latest announcements..."
	hkexnews_url = 'http://www.hkexnews.hk/listedco/listconews/mainindex/SEHK_LISTEDCO_DATETIME_TODAY.HTM'
	page = Nokogiri::HTML(open(hkexnews_url))
	even_announcements = page.css("tr.row0") # all the even 'white' rows
	odd_announcements = page.css("tr.row1") # all the odd 'blue' rows

	puts "Synchronizing with the database"
	i = 0
	while i < even_announcements.length || i < odd_announcements.length
		if i < even_announcements.length
			process_announcement(even_announcements[i])
		end
		if i < odd_announcements.length
			process_announcement(odd_announcements[i])
		end
		i += 1
	end

	puts "Done!"
end
