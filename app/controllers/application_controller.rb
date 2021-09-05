class ApplicationController < ActionController::Base
  # @user = User.find(params[:username])
protect_from_forgery with: :exception

# before_action :authenticate_user!

before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :admin])
    devise_parameter_sanitizer.permit(:sign_in, keys:[:first_name, :last_name, :phone_number, :admin])
    devise_parameter_sanitizer.permit(:account_update, keys:[:first_name, :last_name, :phone_number, :admin])
  end

  
  def show 
      # render 'index'  //defualt 
  end
end
