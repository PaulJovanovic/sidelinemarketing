class AdminController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout "admin"
  protect_from_forgery with: :exception
  # before_filter :authenticate_admin!
end
