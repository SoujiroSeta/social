class HomeController < ApplicationController
	def index
	end

	def create
		a = params[:a].to_i
		b = params[:b].to_i
		@total = a + b
	end
end