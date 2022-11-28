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
  if @my_page.update(my_page_params)
   redirect_to my_page_path
  else
   render :edit
  end
 end

 private

 def my_page_params
  params.require(:user).permit(:name, :email, :profile_image)
 end
end