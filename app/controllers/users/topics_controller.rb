class Users::TopicsController < ApplicationController
  before_action :authenticate_user!

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    if @topic.save
     redirect_to topics_path(@topic.id)
    else
     render :new
    end
  end

  def index
    @topics = Topic.all
    @topics_favorites = Topic.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
  end

  def show
    @topic = Topic.find(params[:id])
    @topic_comment = TopicComment.new
  end

  def destroy
    topic = Topic.find(params[:id])
    topic.destroy
    redirect_to topics_path
  end

  private

  def topic_params
   params.require(:topic).permit(:name, :overview, :profile_image)
  end
end
