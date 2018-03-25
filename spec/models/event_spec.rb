require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:my_user){ User.create!(email:"helloworld@helloworld.com", password: "password", password_confirmation:"password") }
  let(:my_application){ RegisteredApplication.create!(user_id: my_user.id, name: "myawesomeapp", url: "http://www.awesomeapp.com") }
  let(:my_event){ Event.create!(name: "awesome_event", registered_application: my_application ) }

  it { is_expected.to belong_to(:registered_application) }

  describe "attributes" do
    it "should have a name" do
      expect(my_event).to have_attributes(name: "awesome_event")
    end

    it "should have a registered_application" do
      expect(my_event).to have_attributes(registered_application: my_application)
    end

  end



end
