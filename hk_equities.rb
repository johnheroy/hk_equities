require 'rubygems'
require 'nokogiri'
require 'open-uri'

# METHOD DECLARATIONS

# method to process 1) date+time, 2) ticker, 3) name, and 4) document name
def process_announcement(announcement)
	raw_text = announcement.text

	date = raw_text[0,10] # => DD/MM/YYYY
	time = raw_text[10, 5] # => HH:MM
	ticker = raw_text[15, 5] # => ##### (5 digits)
	name = announcement.css("td nobr").text.split(" ").map {|word| word.capitalize}.join(" ") # title case
	document_name = announcement.css("a.news").text.split(" ").map {|word| word.capitalize}.join(" ") # title case
	
	[date, time, ticker, name, document_name]
end

# Returns user-friendly String to describe announcement
def display_announcement(annc_arr)
	# load variable names into method for easy use
	date = annc_arr[0]
	time = annc_arr[1]
	ticker = annc_arr[2]
	name = annc_arr[3]
	document_name = annc_arr[4]

	name + " (" + ticker + ".HK) made an announcement on " + date + " at " + time + " (" + document_name + ")"
end

#returns all announcements for a particular ticker
def get_announcements(arr, ticker) # for now ticker must be a 5 char string
	filtered = []
	for i in 0...arr.length
		if arr[i][2] == ticker
			filtered << arr[i]
		end
		i += 1
	end
	filtered
end

# PROCESSES

page = Nokogiri::HTML(open('http://www.hkexnews.hk/listedco/listconews/mainindex/SEHK_LISTEDCO_DATETIME_TODAY.HTM'))

even_announcements = page.css("tr.row0") # all the even 'white' rows
odd_announcements = page.css("tr.row1") # all the odd 'blue' rows

all_announcements = []

# add both lists to all_announcements while keeping the chronological order
i = 0
while i < even_announcements.length || i < odd_announcements.length
	if i < even_announcements.length
		all_announcements << process_announcement(even_announcements[i])
	end
	if i < odd_announcements.length
		all_announcements << process_announcement(odd_announcements[i])
	end
	i += 1
end

filtered = get_announcements(all_announcements, "00825")

# display everything in chronological order
for i in 0...filtered.length
	puts display_announcement(filtered[i])
	i += 1
end