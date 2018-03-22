require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do
  let (:my_user) {User.create!(email: 'blochead@bloc.io', password: 'password', password_confirmation: 'password')}
  let(:registered_application) { RegisteredApplication.create!(user_id: my_user.id, name: "application name", url: "http://www.test.url.com" )}

   it { is_expected.to belong_to(:user) }

  describe "attributes" do
    it "has a name" do
      expect(registered_application).to have_attributes(name: registered_application.name)
    end
    it "has a url" do
      expect(registered_application).to have_attributes(url: registered_application.url)
    end
  end


end
