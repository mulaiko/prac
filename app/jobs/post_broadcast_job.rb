class PostBroadcastJob < ApplicationJob  
  queue_as :live_posts
  
  def perform(user, post) 
    users_to_broadcast_to = user.user_followers.ids << user.id
    users_to_broadcast_to.each do |id|
      ActionCable.server.broadcast "live_posts: #{id}", content: render(post.decorate)
    end
  end 

  private 
	  def render(post)
	    ApplicationController.renderer.render(partial: 'posts/post', locals: { post: post })    
	  end
end 