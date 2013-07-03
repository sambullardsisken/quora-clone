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
    unless logged_in?
      redirect_to new_session_url
      return
    end

    @user = current_user
    @subjects = @user.subjects
    @questions = Question.all
    render :show
  end

end
