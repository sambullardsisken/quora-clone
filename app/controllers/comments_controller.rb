class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(params[:comment])
    @comment.save!
    respond_to do |format|
      format.json { render :json => @comment.to_json(:include => :user) }
    end
  end

  def index
    @answer = Answer.find(params[:answer_id])
    @comments = @answer.comments
    respond_to do |format|
      format.json { render :json => @comments.to_json(:include => :user) }
    end
  end
end
