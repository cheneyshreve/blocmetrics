require 'rails_helper'

RSpec.describe User, type: :model do

  let (:user) {User.create!(email: "test@email.com", password: "password", password_confirmation: "password")}

  let(:registered_application) { RegisteredApplication.create!(user_id: user.id, name: "application name", url: "http://www.test.url2.com" )}

  it { is_expected.to have_many(:registered_applications) }

  describe "attributes" do
     it "responds to email" do
      expect(user).to respond_to(:email)
     end

     it "responds to password" do
       expect(user).to respond_to(:password)
     end

     it "responds to password_confirmation" do
       expect(user).to respond_to(:password_confirmation)
     end
  end

end
