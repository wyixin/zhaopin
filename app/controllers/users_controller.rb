class UsersController < ApplicationController
  before_action :is_admin?

  def index
    @users = User.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create_user

    @user = User.create(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation],
                role: :customer)
    respond_to do |format|
      if @user
        format.html { redirect_to :users, notice: '客服新建成功.' }
        format.json
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

end
