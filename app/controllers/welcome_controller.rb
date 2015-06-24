class WelcomeController < ApplicationController
  def index
    if current_user.present?
      redirect_to :edit_resumes
      return
    end
  end
end
