require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  before do
     @user = FactoryBot.create(:user)
  end
  describe "#update" do
    context "update columns without password" do
      it "fullnanmeが更新されること"
      it "usernameが更新されること"
      it "websiteが更新されること"
      it "introductionが更新されること"
      it "emailが更新されること"
      it "phoneが更新されること"
      it "sexが更新されること"
      it "fullnameを空にした場合、失敗すること"
      it "usernameをからにした場合、失敗すること"
      it "emailを空にした場合、失敗すること"
    end
    
    context "change password" do
      it "パスワードの変更が成功すること"
      it "現在のパスワードが間違っている場合、変更に失敗すること"
      it "新しいパスワードと新しいパスワードの確認が不一致の場合、変更に失敗すること"
    end
  end
end