class PostBroadcastJob < ApplicationJob  
  queue_as :default
  
  def perform(user, post) 
    user.following_ids.each do |id|
      ActionCable.server.broadcast "live_posts: #{id}", message: render(post.decorate)
    end
  end 

  private 
	  def render(post)
	    ApplicationController.renderer.render(partial: 'posts/post', locals: { post: post })    
	  end
end 