class QuestionsController < ApplicationController
  def index
    @user = current_user
    if params.include?(:topic_id)
      @topic = Topic.find(params[:topic_id])
      @questions = @topic.questions
    else
      @questions = Question.all
    end

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

  def show
    @user = current_user
    @question = Question.find(params[:id])
    @topics = @question.topics
    @answers = @question.answers.sort_by {|answer| answer.votes}.reverse
  end

end
