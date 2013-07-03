class QuestionsController < ApplicationController
  def index
    @user = current_user
    @questions = Question.all
  end

  def create
    @question = current_user.questions.build(params[:question])
    @question.save!
    respond_to do |format|
      format.json { render :json => @question }
    end
  end

end
