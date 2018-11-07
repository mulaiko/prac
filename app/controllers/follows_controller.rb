class FollowsController < ApplicationController
	 before_action :set_user

	 def create   
    current_user.follow(@user)
    render partial: 'users/follow_user', locals: { user: @user}
  end

  def destroy
    current_user.stop_following(@user)
    render partial: 'users/follow_user', locals: { user: @user}
  end

  def set_user
    @user = User.find(params[:user_id])
  end 
end