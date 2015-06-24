class WelcomeController < ApplicationController
  def index
    if current_user.present?
      redirect_to :edit_resume
      return
    end
  end
end
