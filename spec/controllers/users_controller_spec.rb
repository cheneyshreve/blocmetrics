require 'rails_helper'
require 'devise'

RSpec.describe UsersController, type: :controller do
   let (:test_user) {User.create!(email: "tester@test.com", password: "password", password_confirmation: "password" ) }

  describe "GET #show" do
    before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:user]
       user = FactoryBot.create(:user)
       sign_in user
    end

    it "returns http success" do
      get :show, params: { id: test_user.id }
      expect(response).to have_http_status(:success)
    end
  end

end
