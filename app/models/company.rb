class Company < ActiveRecord::Base
	has_many :announcements, dependent: :destroy
	has_many :assignments
	has_many :users, through: :assignments
	validates :ticker, uniqueness: true
	validates :hk_ticker, uniqueness: true, numericality: { greater_than: 0 }
end
