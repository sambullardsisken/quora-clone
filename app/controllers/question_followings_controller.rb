class QuestionFollowingsController < ApplicationController
  def create
    @following = current_user.question_followings.build(params[:question_following])
    @following.save!
    respond_to do |format|
      format.json { render :json => @following }
    end
  end

  def destroy
    @following = QuestionFollowing.where({user_id: current_user.id, question_id: params[:id]}).first
    QuestionFollowing.destroy(@following.id)
    respond_to do |format|
      format.json { render :json => @following }
    end
  end

end
