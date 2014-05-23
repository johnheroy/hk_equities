desc "Populate total list of companies with pretty names from Bloomberg.com"

task :populate_companies => :environment do
	require 'nokogiri'
	require 'open-uri'

	def process_row(row)
		data = row.css("td")
		pretty_name = data[0].css("span").text
		hk_ticker = data[1].text[0..-4].to_i
		type = data[2].text
		subindustry = data[3].text

		# Check each company in the list against the database.
		# If it doesn't exist, add it
		# If it does exist, update the name

		coy = Company.find_by_hk_ticker(hk_ticker)
		if coy
			coy.pretty_name = pretty_name
			coy.bloomberg_security_type = type
			coy.bloomberg_subindustry = subindustry
			coy.save
		else
			Company.create(pretty_name: pretty_name, bloomberg_security_type: type, 
				bloomberg_subindustry: subindustry, hk_ticker: hk_ticker, ticker: (hk_ticker.to_s + ".HK"))
		end

	end

	# http://www.bloomberg.com/markets/companies/country/hong-kong/
	# There are nine pages here, so we will need to iterate through each page

	puts "Loading HK company list from Bloomberg.com..."

	page_number = 1
	while page_number < 10
		if page_number == 1
			url = "http://www.bloomberg.com/markets/companies/country/hong-kong/"
		else
			url = "http://www.bloomberg.com/markets/companies/country/hong-kong/" + page_number.to_s + "/"
		end

		page = Nokogiri::HTML(open(url))
		rows = page.css("table.ticker_data tr")

		# First tr should be the header so start with rows[1] for each page
		for i in 1...rows.length
			process_row(rows[i])
		end

		puts "Loaded page #{page_number}!"

		page_number += 1
	end

end