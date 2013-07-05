class AnswerDownVotesController < ApplicationController
  def create
    @answer_down_vote = AnswerDownVote.new(params[:answer_down_vote])
    @answer = Answer.find(params[:answer_down_vote][:answer_id])
    @answer.votes -= 1
    @answer.save!
    @answer_down_vote.user_id = current_user.id
    @answer_down_vote.save!
    respond_to do |format|
      format.json { render :json => @answer_down_vote }
    end
  end

end
