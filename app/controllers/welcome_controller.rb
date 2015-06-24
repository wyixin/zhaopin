class WelcomeController < ApplicationController
  def index
    current_user.init_resume
    if current_user.present?
      redirect_to :edit_resumes
      return
    end
  end
end
