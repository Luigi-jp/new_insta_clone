FactoryBot.define do
  factory :comment do
    content "test comment"
    association :post
    user  { post.user }
  end
end
