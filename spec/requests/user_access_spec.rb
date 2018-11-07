require "rails_helper"

RSpec.describe "Users", :type => :request do
  describe "Public access to users", type: :request do

    it "allows access to users#index" do
      get users_path
      expect(response).to have_http_status(200)
    end

    it "denies access to users#follow_feed" do
      get follow_feed_path
      expect(response).to redirect_to new_user_session_url
    end

    it "denies access to users#show" do
      get user_path(create(:user))
      expect(response).to redirect_to new_user_session_url
    end

    context "Follows" do      
      it "denies following a user" do
        post "/users/1/follows"
        expect(response).to redirect_to new_user_session_url
      end

      it "denies unfollowing a user" do
        delete "/users/1/follows/2"
        expect(response).to redirect_to new_user_session_url
      end
    end
  end
end