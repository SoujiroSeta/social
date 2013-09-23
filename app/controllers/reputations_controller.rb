class ReputationsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@reputations = current_user.reputations
	end

	def create
		@reputation = Reputation.new(params[:reputation]) do |r|
				r.from = current_user
		end
		@reputation.save
		respond_to do |format|
			format.js
		end
	end

end