desc "Fetch latest announcements from the HKEx website"

task :fetch_announcements => :environment do
	require 'nokogiri'
	require 'open-uri'

	def process_announcement(announcement)
		link = "http://www.hkexnews.hk" + announcement.css("a")[0]["href"]
		raw_text = announcement.text

		year = raw_text[6,4].to_i
		month = raw_text[3,2].to_i
		day = raw_text[0,2].to_i
		hour = raw_text[10,2].to_i
		min = raw_text[13,2].to_i

		t = Time.zone.local(year, month, day, hour, min)
		ticker_integer = raw_text[15, 5].to_i
		ticker_string = ticker_integer.to_s + ".HK"
		name = announcement.css("td nobr").text.split(" ").map {|word| word.capitalize}.join(" ")
		document_name = announcement.css("a.news").text.split(" ").map {|word| word.capitalize}.join(" ")
		
		coy = Company.new(name: name, ticker: ticker_string, hk_ticker: ticker_integer)
		if !coy.save
			coy = Company.find_by_ticker(ticker_string)
		end

		Announcement.create(datetime: t, 
							url: link,
							message: document_name, 
							company: coy, 
							unique_code: (t.to_s + document_name + coy.ticker))
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
