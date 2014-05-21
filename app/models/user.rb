class User < ActiveRecord::Base
	has_many :assignments
	has_many :companies, through: :assignments
end
