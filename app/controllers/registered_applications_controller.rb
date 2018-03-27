class RegisteredApplicationsController < ApplicationController
 before_action :authenticate_user!

  def index
     @registered_applications = RegisteredApplication.all
  end

  def show
    @registered_applications = RegisteredApplication.all
    @user = current_user
    @registered_application = @user.registered_applications

    if @registered_application.first.nil?
      redirect_to registered_applications_new_path, notice: "You must register an application first."
    else
      @events = @registered_application.first.events.group_by(&:name)
    end
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = RegisteredApplication.new(app_params)
    @registered_application.user = current_user

    if @registered_application.save
       redirect_to @registered_application, notice: "The application was registered successfully."
    else
      flash.now[:alert] = "Error registering application. Please try again."
      render :new
    end
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
    @registered_application.assign_attributes(app_params)

    if @registered_application.save
       redirect_to @registered_application, notice: "The application was updated successfully."
    else
      flash.now[:alert] = "Error editing application. Please try again."
      render :edit
    end

  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])
    if @registered_application.destroy
     flash[:notice] = "\"#{@registered_application.name}\" was deleted successfully."
     redirect_to registered_applications_show_path
    else
     flash.now[:alert] = "There was an error deleting the application."
     render :show
    end
  end

  private
  def app_params
    params.require(:registered_application).permit(:name, :url, :user_id, :id)
  end


end
