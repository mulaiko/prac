require "rails_helper"
require "byebug"

RSpec.describe PostChannel, :type => :channel do
	let!(:current_user) { create(:user) }
	before(:each) do
    stub_connection current_user: current_user
   	subscribe   
  end

  context "#create_post" do
    it "successfully creates a post instance" do        
      expect {
        perform :create_post, content: "My post content!"
      }.to change { current_user.posts.count }
    end
  end
  
  it "successfully subscribes" do
   expect(subscription).to be_confirmed
  end

	it "successfully subscribes to user stream" do
    expect(subscription).to be_confirmed
    expect(streams).to include("live_posts: #{current_user.id}")
  end

  it "successfully unsubscribes from stream" do
    expect(streams).to include("live_posts: #{current_user.id}")

    perform :unsubscribed
    expect(streams).to eq []
  end
end