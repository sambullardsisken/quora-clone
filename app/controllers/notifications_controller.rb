class NotificationsController < ApplicationController
  def index
    notes = []
    current_user.follower_instances.each do |follower|
      next if follower.user === current_user
      notes << follower.to_json(:include => [:question, :user])
    end
    current_user.replies.each do |reply|
      next if notes.include?(reply) || reply.user == current_user
      notes << reply.to_json(:include => [:question, :user])
    end
    current_user.answer_comments.each do |comment|
      next if notes.include?(comment) || comment.user == current_user
      notes << comment.to_json(:include => [:question, :user])
    end
    sorted = notes.sort_by {|note| JSON.parse(note)["created_at"]}.reverse
    respond_to do |format|
      format.html { render :index }
      format.json { render :json => sorted }
    end
  end
end
