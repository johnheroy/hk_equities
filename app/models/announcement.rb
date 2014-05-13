class Announcement < ActiveRecord::Base
	belongs_to :company
	validates :unique_code, uniqueness: true
end
