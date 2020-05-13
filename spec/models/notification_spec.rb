require 'rails_helper'

RSpec.describe Notification, type: :model do
  
  #データが関連付けされていて、actionが有れば有効である
  it "is valid associated data with action" do
    expect(FactoryBot.build(:notification)).to be_valid
  end
  
  #actionが無ければ無効である
  it "is invalid without a action" do
    expect(FactoryBot.build(:notification, action: nil)).to_not be_valid
  end
  
  #visitorが関連付けされていないデータは無効である
  it "is invalid not associated with user" do
    expect(FactoryBot.build(:notification, visitor: nil)).to_not be_valid
  end
  
  #checkedにはデフォルトでfalseが設定されている
  it "default set false to action" do
    notification = FactoryBot.build(:notification)
    expect(notification.checked).to eq false
  end
end
