class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def is_user?
    if current_user.blank?
      redirect_to :new_user_session
      return
    end
  end
  
  def is_customer?
    is_user?

    if !current_user.role.customer?
      redirect_to :back
      return
    end
  end

  def is_admin?
    is_user?

    if !current_user.role.admin?
      redirect_to :back
      return
    end
  end
  
end
