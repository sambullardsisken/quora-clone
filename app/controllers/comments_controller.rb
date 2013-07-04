class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(params[:comment])
    @comment.save!
    respond_to do |format|
      format.json { render :json => @comment }
    end
  end

end
