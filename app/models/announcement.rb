class Announcement < ActiveRecord::Base
	belongs_to :company
	# do I want to have any validations?
end
