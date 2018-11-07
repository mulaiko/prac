FactoryBot.define do
  factory :post do
  	association :user
    content { Faker::SiliconValley.quote }
    end
end