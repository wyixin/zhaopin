class WelcomeController < ApplicationController
  def index
    if current_user.present?
      case current_user.role
        when 'customer'
          redirect_to :companies
        when 'admin'
          redirect_to :users
        else
          redirect_to :display_resumes
      end
      return
    end
  end
end
