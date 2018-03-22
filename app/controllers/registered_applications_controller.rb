class RegisteredApplicationsController < ApplicationController


  def index
     @registered_applications = RegisteredApplication.all
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = RegisteredApplication.new(app_params)

    if @registered_application.save
       redirect_to registered_applications_path, notice: "The application was registered successfully."
    else
      flash.now[:alert] = "Error registereding application. Please try again."
      render :new
    end
  end

  def edit

  end

  def update
  end

  def destroy
  end

  private
  def app_params
    params.require(:registered_application).permit(:name, :url, :id, :user_id, :created_at, :updated_at)
  end


end
