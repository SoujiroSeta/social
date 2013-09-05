class SuperAdminController < ApplicationController
  before_filter :before_filter_callback
  def index
  	@users = User.all
  end

  def update
  	update_admin(true)
  end

  def destroy
  	update_admin(false)
  end

  private

  def before_filter_callback
  	authenticate_user!
  	redirect_to user_path(current_user) unless current_user.super_admin?
  end

  def update_admin(flag)
  	@user = User.find params[:id]
  	@user.is_admin = flag
  	@user.save
  	redirect_to super_admin_index_path
  end
end
