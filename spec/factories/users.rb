FactoryBot.define do
  factory :user, aliases: [:follower, :followed, :visited, :visitor] do
    fullname {"Testuser"}
    sequence(:username) { |n| "test#{n}"}
    sequence(:email) { |n| "text#{n}@example.com"}
    password {"password"}
  end
end
