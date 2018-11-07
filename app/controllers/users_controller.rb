class UsersController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index]
	before_action :set_user, only: [:show]

  def index
  end

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