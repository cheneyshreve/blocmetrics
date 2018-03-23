class WelcomeController < ApplicationController

  def index
    @registered_applications = RegisteredApplication.all
    @users = User.all
  end

  def about
  end
end
