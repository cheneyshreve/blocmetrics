require 'rails_helper'
require 'devise'

RSpec.describe RegisteredApplicationsController, type: :controller do

  let(:this_user) { User.create!(email: 'blocbloc@bloc.io', password: 'password', password_confirmation: 'password') }
  let(:my_app) { RegisteredApplication.create!(user_id: this_user.id, name: "application name", url: "http://www.someawesomesite.com" )}

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

  describe "POST create" do
    before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:user]
       user = FactoryBot.create(:user)
       sign_in user
    end

    it "assigns the new app to @registered_application" do
      post :create, params: { id: my_app.id, registered_application: { name: "somename", url: "someurl", user_id: this_user.id } }
      expect(assigns(:registered_application)).to eq RegisteredApplication.last
    end

    it "redirects to the new registered_application" do
      post :create, params: { id: my_app.id, registered_application: { name: "somename", url: "someurl", user_id: this_user.id } }
      expect(response).to redirect_to [RegisteredApplication.last]
    end
  end

  describe "GET #edit" do
    before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:user]
       user = FactoryBot.create(:user)
       sign_in user
    end
    it "returns http success" do
      get :edit, params: { id: my_app.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT update" do
    before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:user]
       user = FactoryBot.create(:user)
       sign_in user
    end
      it "returns http redirect" do
        new_name = "fancynewname"
        new_url = "fancynewurl"
        put :update, params: { id: my_app.id, registered_application: { name: new_name, url: new_url } }
        expect(response).to redirect_to(my_app)
      end
    end

    describe "DELETE destroy" do
      before(:each) do
         @request.env["devise.mapping"] = Devise.mappings[:user]
         user = FactoryBot.create(:user)
         sign_in user
      end
       it "deletes the topic" do
         delete :destroy, params: { id: my_app.id }
         count = RegisteredApplication.where({id: my_app.id}).size
         expect(count).to eq 0
       end

       it "redirects to topics index" do
         delete :destroy, params: { id: my_app.id }
         expect(response).to redirect_to (registered_applications_show_path)
       end
     end


end
