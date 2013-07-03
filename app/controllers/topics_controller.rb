class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    respond_to do |format|
      format.json { render :json => @topics }
    end
  end

end
