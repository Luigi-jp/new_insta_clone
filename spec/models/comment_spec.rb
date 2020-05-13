require 'rails_helper'

RSpec.describe Comment, type: :model do
  
  #関連付けされ、contentが有れば有効であること
  it "is valid associated data with a content" do
    expect(FactoryBot.build(:comment)).to be_valid
  end
    
  #contentが無ければ無効であること
  it "is invalid without a content" do
    expect(FactoryBot.build(:comment, content: nil)).to_not be_valid
  end
  
  #ユーザーと関連付けされていなければ無効であること
  it "is invalid not associated user data" do
    expect(FactoryBot.build(:comment, user_id: nil)).to_not be_valid
  end
  
  #Postと関連付けされていなければ無効であること
  it "is invalid not associated post data" do
    expect(FactoryBot.build(:comment, post_id: nil)).to_not be_valid
  end
end
