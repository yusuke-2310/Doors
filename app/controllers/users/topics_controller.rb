class Users::TopicsController < ApplicationController

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    @topic.save
    redirect_to topics_path(topic.id)
  end

  def index
    @topics = Topic.all
  end

  def show
    @my_page = MyPage.find(params[:id])
    @topic = Topic.find(params[:id])
    @topic_comment = TopicComment.new
  end

  private

  def topic_params
   params.require(:topic).permit(:name, :overview, :image)
  end
end
