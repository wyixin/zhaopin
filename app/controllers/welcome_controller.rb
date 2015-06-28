class WelcomeController < ApplicationController
  def index
    if current_user.present?
      login_redirect
      return
    end
  end
end
