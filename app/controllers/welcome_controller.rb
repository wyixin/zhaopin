class WelcomeController < ApplicationController
  def index
    if current_user.present?
      login_redirect
      return
    else
      redirect_to new_user_session_path
      return
    end
  end

  def about_us
  end
end
