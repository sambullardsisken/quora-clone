class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_username(params[:user][:username])

    if @user.nil?
      redirect_to new_session_url
      return
    end

    if @user.verify_password(params[:user][:password])
      login(@user)
      redirect_to user_url(@user)
    else
      redirect_to new_session_url
    end
  end

  def destroy
    logout
  end

end
