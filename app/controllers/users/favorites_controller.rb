class Users::FavoritesController < ApplicationController
  
  def create
    @topic = Topic.find(params[:topic_id])
    @favorites = current_user.favorites.new(topic_id: topic.id)
    @favorite.save
    redirect_to topic_path(topic)
  end
  
  def destroy
    @topic = Topic.find(params[:Topic_id])
    @favorite = current_user.favorites.find_by(topic_id: topic.id)
    @favorite.destroy
    redirect_to topic_path(topic)
  end
end
