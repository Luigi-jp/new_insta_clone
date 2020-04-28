require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(
      fullname: "Testuser",
      username: "Tester",
      email: "test@example.com",
      password: "password")
    end
  #フルネーム、ユーザーネーム、E-mail、パスワードがあれば有効であること
  it "is valid with a fullname, username, email, and password" do
    expect(@user).to be_valid
  end
  #フルネームが無ければ無効であること
  it "is invalid without a fullname" do
    @user.fullname = ""
    expect(@user).to_not be_valid
  end
  #ユーザーネームが無ければ無効であること
  it "is invalid without a username" do
    @user.username = ""
    expect(@user).to_not be_valid
  end
  #重複したユーザーネームなら無効であること
  it "is invalid with a duplicate username" do
    User.create(
      fullname: "Testuser",
      username: "Tester",
      email: "test@example.com",
      password: "password")
    expect(@user).to_not be_valid
  end
end
