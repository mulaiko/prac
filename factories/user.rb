FactoryBot.define do
  factory :user do
    name { Faker::Internet.username }
    email  { Faker::Internet.email }
    bio  { Faker::Lorem.sentence } 
    password { Faker::Internet.password }
    confirmed_at { Time.now }

    factory :user_with_posts do
    	after(:create) do |user|
    		3.times { create(:post, user: user) }
    	end
    end

    factory :user_with_follower do
        after(:create) do |this_user|
            create(:user).follow(this_user)
        end
    end
  end
end