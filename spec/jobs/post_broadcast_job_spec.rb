require "rails_helper"

RSpec.describe PostBroadcastJob do
	let!(:user_with_follower) { create(:user_with_follower) }
	it "broadcasts to the correct stream" do
    ActiveJob::Base.queue_adapter = :test
    expect{ 
    	PostBroadcastJob.perform_now(user_with_follower, build(:post))
    	}.to have_broadcasted_to("live_posts: #{user_with_follower.user_followers.ids[0]}")
  end
end