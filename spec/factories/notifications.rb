FactoryBot.define do
  factory :notification do
    association :visitor
    association :post
    comment nil
    action "favorite"
    visited { post.user }
  end
end
