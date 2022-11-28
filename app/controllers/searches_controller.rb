class SearchesController < ApplicationController


  def search
    @range = params[:range]
    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @topics = Topic.looks(params[:search], params[:word])
    end
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @user = User.where("name LIKE?","#{word}%")
    elsif search == "partial_match"
      @user = User.where("name LIKE?","#{word}%")
    else
      @user = User.all
    end
  end
end
