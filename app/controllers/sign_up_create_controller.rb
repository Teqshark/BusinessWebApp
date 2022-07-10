class SignUpCreateController < ApplicationController
  before_action :not_logged_in

  
  

  def index 
    render :new
  end

  def new 
    @sign_up_create |= SignUpCreate.new
    @user |= User.new 
    # @project |= Project.new
    # @user.projects.build
  end
  
  def create 
    @sign_up_create = SignUpCreate.new(sign_up_create_params) 

    # @user = User.new(user_params)
  # @user = User.new(signup_params_for_create)
  # @project = Project.new()

  # if person.save
    # redirect or render
    if @sign_up_create.save 
    # if @user.save 
      # @project.save 
      redirect_to dashboard_index_url, notice: 'Success! You signed up and created your first project!'
      # flash[:color] = "invalid"
    else 
      flash.now[:alert] = "Invalid Input! "
      # flash[:notice] = @sign_up_create.errors.details
        flash.now[:color] = "invalid"
      render :new
    end

  end

  private 
  def not_logged_in
    if user_signed_in? 
       redirect_to dashboard_new_path
    else 
       # do something else ...
    end
  end
  def sign_up_create_params 
    params.permit(:email, :first_name, :last_name, :phone_number, :password, :length, :height, :width, :street_name, :city, :state, :zip_code, :desired_start_date, :desired_completion_date, :remember_me, :terms, :email_consent)
    
  end
  # private
  # def signup_params_for_create
  #   params
  #     .require(:user)
  #     .permit(:email, :first_name, :last_name, :phone_number, :password, 
  #       projects_attributes: [:zip_code, :length, :height, :width]) # permit one-to-many fields
  # end
     helper_method  :devise_mapping
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end