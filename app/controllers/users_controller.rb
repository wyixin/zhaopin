class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def set_customer
    @user = User.find(params[:id])
    if @user.role.customer?
      @user.update_attribute(:role, :user)
    else
      @user.update_attribute(:role, :customer)
    end
    respond_to do |format|
      format.html { redirect_to :users, notice: '操作成功.' }
      format.json { render :display, status: :created, location: @resume }
    end


  end
end
