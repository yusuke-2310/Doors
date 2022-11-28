class Admins::TopicCommentsController < ApplicationController

  def destroy
   TopicComment.find(params[:id]).destroy
   redirect_to topic_path(params[:topic_id])
  end

end
