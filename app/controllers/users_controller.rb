class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:follow_feed]
	before_action :set_user, only: [:show]

  def show
    @posts = PostDecorator.decorate_collection(@user.posts)
  end

  def follow_feed 
    @post = current_user.posts.build
    @posts = PostDecorator.decorate_collection(current_user.following_posts)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end 
end