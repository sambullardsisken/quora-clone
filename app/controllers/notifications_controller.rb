class NotificationsController < ApplicationController
  def index
    notes = {}
    # current_user.question_followings.each do |following|
  #     notes << following unless notes.include?(following)
  #   end
    current_user.replies.each do |reply|
      next if notes.include?(reply) || reply.user == current_user
      notes[reply.to_json(:include => :question)] = reply.user
    end
    current_user.answer_comments.each do |comment|
      next if notes.include?(comment) || comment.user == current_user
      notes[comment.to_json(:include => :question)] = comment.user
    end
    respond_to do |format|
      format.html { render :index }
      format.json { render :json => notes }
    end
  end
end
