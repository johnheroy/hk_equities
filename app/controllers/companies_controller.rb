class CompaniesController < ApplicationController
	before_action :get_company, only: [:show] # can add other methods in here

	def get_company
		@coy = Company.find(params[:id])
	end

	def index
		
	end

	def show

	end

	def follow
		@coy = Company.find_by_hk_ticker(params[:hk_ticker])
		@coy.users << current_user

		respond_to do |format|
			format.html { redirect_to show_ticker_path }
			format.js
		end
	end

	def unfollow 
		@coy = Company.find_by_hk_ticker(params[:hk_ticker])
		@coy.users.delete(current_user)
		
		respond_to do |format|
			format.html { redirect_to show_ticker_path }
			format.js
		end
	end

	def show_ticker
		@coy = Company.find_by_hk_ticker(params[:hk_ticker])
		render "show"
	end

end
