class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      login(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def show
    @user = current_user
    render :show
  end

end
