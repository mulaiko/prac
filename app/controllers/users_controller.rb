class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:follow_feed]
	before_action :set_user, only: [:show]

  def show
    @posts = decorate_collection(@user.posts)
  end

  def follow_feed 
    @post = current_user.posts.build
    @posts = decorate_collection(UserVisiblePostsQuery.call(current_user))
  end

  private

  def set_user
    @user = User.find(params[:id])
  end 

  def decorate_collection(collection)
    PostDecorator.decorate_collection(collection)
  end
end