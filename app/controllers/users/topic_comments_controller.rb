class Users::TopicCommentsController < ApplicationController

  def create
   @topic = Topic.find(params[:topic_id])
   @comment = current_user.topic_comments.new(topic_comment_params)
   @comment.topic_id = @topic.id
   @comment.save!
   redirect_to topic_path(@topic.id)
  end

  def destroy
   TopicComment.find(params[:id]).destroy
   redirect_to topic_path(params[:topic_id])
  end

  private

  def topic_comment_params
   params.require(:topic_comment).permit(:comment)
  end

end
