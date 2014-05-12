class Announcement < ActiveRecord::Base
	belongs_to :company
	# do I want to have any validations?
	# perhaps validations of uniqueness--create one extra column called like annc_identifier that
	# concatenates a few other fields and must be unique *** do this
end
