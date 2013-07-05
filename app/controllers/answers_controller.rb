class AnswersController < ApplicationController
  respond_to :json

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(params[:answer])
    @answer.user_id = current_user.id
    @answer.votes = 0
    @answer.save!
    render :json => @answer
  end

  def show
    @answer = Answer.find(params[:id])
    @comments = @answer.comments
  end

end
