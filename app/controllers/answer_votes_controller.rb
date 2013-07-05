class AnswerVotesController < ApplicationController
  def create
    @answer_vote = AnswerVote.new(params[:answer_vote])
    @answer = Answer.find(params[:answer_vote][:answer_id])
    @answer.votes += 1
    @answer.save!
    @answer_vote.user_id = current_user.id
    @answer_vote.save!
    respond_to do |format|
      format.json { render :json => @answer_vote }
    end
  end


end
