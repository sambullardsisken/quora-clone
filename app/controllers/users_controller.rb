class UsersController < ApplicationController
  def new
    @subjects = Subject.all
    @user = User.new
    render :new
  end

  def create
    @user = User.new(params[:user])
    if @user.save!
      login(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    unless @user === current_user
      redirect_to new_session_url
      return
    end
    @subjects = @user.subjects
    render :show
  end
end
