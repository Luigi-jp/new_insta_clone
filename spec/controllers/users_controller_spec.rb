require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before do
    @user = User.create(
      fullname: "Testuser",
      username: "Tester",
      email: "test@example.com",
      password: "password")
    end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: @user }
      expect(response).to have_http_status(:success)
    end
  end

end
