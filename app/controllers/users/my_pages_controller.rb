class Users::MyPagesController < ApplicationController

 def show
  @my_page = User.find(params[:id])
  @topics = @my_page.topics
 end

 def edit
  @my_page = User.find(params[:id])
 end

 def update
  @my_page = User.find(params[:id])
  @my_page.update(my_page_params)
  redirect_to my_page_path
 end

 private

 def my_page_params
  params.require(:user).permit(:name, :email, :image)
 end
end