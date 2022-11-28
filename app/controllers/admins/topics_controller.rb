class Admins::TopicsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @topic_comment = TopicComment.new
  end

  def destroy
    topic = Topic.find(params[:id])
    topic.destroy
    redirect_to admins_topics_path
  end

end
