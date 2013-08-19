class TagsController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound do |ex|
		return render file "#{Rails.root}/public/404.html"
	end

  def show
  	@tag = ActsAsTaggableOn::Tag.find(params[:id])
  end
end
