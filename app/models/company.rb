class Company < ActiveRecord::Base
	has_many :announcements
	validates :ticker, uniqueness: true
	validates :hk_ticker, uniqueness: true
end
