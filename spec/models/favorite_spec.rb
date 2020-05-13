require 'rails_helper'

RSpec.describe Favorite, type: :model do
  
  #関連付けされたデータは有効であること
  it "is valid associated data" do
    expect(FactoryBot.build(:favorite)).to be_valid
  end
  
  #関連付けされていないデータは無効であること
  it "is invalid not associated with user data" do
    expect(FactoryBot.build(:favorite, user: nil)).to_not be_valid
  end
end
