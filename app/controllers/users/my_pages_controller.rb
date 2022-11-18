class Users::MyPagesController < ApplicationController

 def show
  @my_page = current_user
  @topics = @my_page.topics
 end

 def edit
  @my_page = current_user
 end

 def update
  @my_page = current_user
  @my_page.update(my_page_params)
  redirect_to my_page_path
 end

 private

 def my_page_params
  params.permit(:name, :email, :image)
 end
end