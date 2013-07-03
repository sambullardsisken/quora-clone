class AnswersController < ApplicationController
  respond_to :json

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(params[:answer])
    @answer.user_id = current_user.id
    @answer.save!
    render :json => @answer
  end

end
