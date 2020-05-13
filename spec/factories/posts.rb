FactoryBot.define do
  factory :post do
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/Achi.jpeg'), 'image/jpeg') }
    association :user
  end
end
