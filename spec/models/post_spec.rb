require 'rails_helper'

RSpec.describe Post, type: :model do
  
  #ユーザーと関連し、pictureがあれば有効であること
  it "is valid  with a picture and associated data" do
    expect(FactoryBot.build(:post)).to be_valid
  end
  
  #pictureが無ければ無効であること
  it "is invalid without a picture" do
    expect(FactoryBot.build(:post, picture: nil)).to_not be_valid
  end
  
  #ユーザーと関連が無ければ無効であること
  it "is invalid not associated data" do
    expect(FactoryBot.build(:post, user_id: nil)).to_not be_valid
  end
    
end
