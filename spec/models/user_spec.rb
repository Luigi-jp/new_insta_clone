require 'rails_helper'

RSpec.describe User, type: :model do

  #フルネーム、ユーザーネーム、E-mail、パスワードがあれば有効であること
  it "is valid with a fullname, username, email, and password" do
    expect(FactoryBot.build(:user)).to be_valid
  end
  #フルネームが無ければ無効であること
  it "is invalid without a fullname" do
    expect(FactoryBot.build(:user, fullname: nil)).to_not be_valid
  end
  #ユーザーネームが無ければ無効であること
  it "is invalid without a username" do
    expect(FactoryBot.build(:user, username: nil)).to_not be_valid
  end
  
  #メールアドレスが無ければ無効であること
  it "is invalid without email" do
    expect(FactoryBot.build(:user, email: nil)).to_not be_valid
  end
  
  #重複したメールアドレスなら無効であること
  it "is invalid with a duplicate email" do
    FactoryBot.create(:user, email: "tester@example.com")
    user = FactoryBot.build(:user, email: "tester@example.com")
    expect(user).to_not be_valid
  end
  
  #重複したユーザーネームなら無効であること
  it "is invalid with a duplicate username" do
    FactoryBot.create(:user, username: "Tester")
    user = FactoryBot.build(:user, username: "Tester")
    expect(user).to_not be_valid
  end
end
