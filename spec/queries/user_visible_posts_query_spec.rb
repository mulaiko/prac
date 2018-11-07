require 'rails_helper'

RSpec.describe UserVisiblePostsQuery do
	context ".call" do
		let!(:user_one) {create(:user)}
	  let!(:user_with_posts_two) {create(:user_with_posts)}
	  let!(:user_with_posts_three) {create(:user_with_posts)}
	  let!(:followed_and_self_posts) {user_with_posts_two.posts.to_a + user_with_posts_three.posts.to_a }

	  it 'returns the posts of followed users' do
		  user_one.follow(user_with_posts_two)
	  	expect(UserVisiblePostsQuery.call(user_one)).to eq user_with_posts_two.posts
	  end

	  it 'does not return posts of a user not followed' do
	    expect(user_one).not_to eq user_with_posts_three.posts
	  end

	  it 'returns self posts and followed users posts' do
	  	user_with_posts_two.follow(user_with_posts_three)
	  	expect(UserVisiblePostsQuery.call(user_with_posts_two).to_a).to match_array followed_and_self_posts
	  end
	end  
end