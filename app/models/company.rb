class Company < ActiveRecord::Base
	has_many :announcements
	validates :ticker, uniqueness: true
end
