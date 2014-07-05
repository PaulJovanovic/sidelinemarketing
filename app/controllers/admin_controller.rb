class AdminController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout "admin"
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :authenticate_admin!

  private

  def authenticate_admin!
    if !current_user.admin?
      render template: "admin/home/pending", layout: "application"
    end
  end
end
