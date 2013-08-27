class SearchController < ApplicationController
  def index
  	@questions = Question.where('title like ?', "%#{params[:q]}%")
  end
end 