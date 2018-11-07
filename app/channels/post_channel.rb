class PostChannel < ApplicationCable::Channel
  def subscribed
    stream_from "live_posts: #{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end

  def create_post(data)
    current_user.posts.create(content: data['content'])    
  end
end