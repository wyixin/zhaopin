class WelcomeController < ApplicationController
  def index
    if current_user.present?
      redirect_to :display_resumes
      return
    end
  end
end
