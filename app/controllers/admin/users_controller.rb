class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only

  def index
  end

  private

  def admin_only
    unless current_user.is_admin?
      redirect_to root_path, :alert => "Access denied."
    end
  end
end
