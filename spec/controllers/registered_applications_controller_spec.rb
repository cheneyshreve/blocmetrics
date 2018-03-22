require 'rails_helper'
require 'devise'

RSpec.describe RegisteredApplicationsController, type: :controller do

  let(:this_user) { User.create!(email: 'blocbloc@bloc.io', password: 'password', password_confirmation: 'password') }
  let(:my_app) { RegisteredApplication.create!(id: 1, user_id: this_user.id, name: "application name", url: "http://www.someawesomesite.com" )}

  describe "GET #index" do
    before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:user]
       user = FactoryBot.create(:user)
       sign_in user
    end

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns Topic.all to topic" do
        get :index
        expect(assigns(:registered_applications)).to eq([my_app])
    end

  end

  describe "GET #show" do
    before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:user]
       user = FactoryBot.create(:user)
       sign_in user
    end

    it "returns http success" do
      get :show, params: { id: my_app.id }
      expect(response).to have_http_status(:success)
    end

    it "returns renders the #show view" do
     get :show, params: {id: my_app.id }
     expect(assigns(:registered_application)).to eq(my_app)
    end
  end

  describe "GET #new" do
    before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:user]
       user = FactoryBot.create(:user)
       sign_in user
    end

    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

  end

  describe "GET #edit" do
    before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:user]
       user = FactoryBot.create(:user)
       sign_in user
    end
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end



end
