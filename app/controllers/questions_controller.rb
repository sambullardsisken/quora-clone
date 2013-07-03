class QuestionsController < ApplicationController
  def index
    @user = current_user
    @questions = Question.all
    # @topic = Topic.find(params[:topic_id])
    # @topic_questions = @topic.questions
    respond_to do |format|
      format.html { render :index }
      format.json { render :json => @questions }
    end
  end

  def create
    @question = current_user.questions.build(params[:question])
    @question.save!
    respond_to do |format|
      format.json { render :json => @question }
    end
  end

end
