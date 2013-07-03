class TopicsController < ApplicationController
  def index
    if params.include?(:subject_id)
      @subject = Subject.find(params[:subject_id])
      @topics = @subject.topics
    else
       @topics = Topic.all
    end

    respond_to do |format|
      format.json { render :json => @topics }
    end
  end

end
