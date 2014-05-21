class CompaniesController < ApplicationController
	before_action :get_company, only: [:show] # can add other methods in here

	def get_company
		@coy = Company.find(params[:id])
	end

  def index
  	
  end

  def show

  end

  def show_ticker
  	@coy = Company.find_by_hk_ticker(params[:hk_ticker])
  	render "show"
  end

end
