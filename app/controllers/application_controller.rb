class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  # before_action :authenticate_user!
  helper_method :is_admin, :is_customer, :is_nobody

  def is_admin?
    current_user && current_user.role.admin?
  end

  def is_customer?
    p (current_user && current_user.role.customer?)
  end
  
  def is_nobody?
    not current_user
  end

end
