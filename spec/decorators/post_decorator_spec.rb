require 'rails_helper'

RSpec.describe PostDecorator do
	let!(:post_user) { create(:user) }
	let!(:post) { create(:post, user: post_user).decorate }

  it 'returns the post user name' do
    expect(post.user_name).to eq post_user.name
  end
end