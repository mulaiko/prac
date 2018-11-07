require 'rails_helper'

RSpec.describe Post, type: :model do
  context "validations" do
    it "is valid with content" do
    	expect(build(:post)).to be_valid
    end

    it "is invalid without content" do
    	post = build(:post, content: nil)
    	post.valid?
    	expect(post.errors[:content]).to include("can't be blank")
    end

    it "is invalid without user association" do
    	post = build(:post, user: nil)
    	post.valid?
    	expect(post.errors[:user]).to include("must exist")
    end
  end

  context 'default scope' do
  	let!(:post_one) {create(:post, created_at: 1.day.ago)}
  	let!(:post_two) {create(:post, created_at: 1.hour.ago)}
    let!(:all_posts_array) { Post.all.to_a}
  
  	it 'orders by descending created date' do
  		expect(all_posts_array).to eq [post_two, post_one]
  	end
  end
end