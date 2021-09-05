class SignUpCreateController < ApplicationController

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
      flash[:color] = "invalid"
    else 
      flash[:notice] = "Invalid Input!"
      # flash[:notice] = @sign_up_create.errors.details
        flash[:color] = "invalid"
      render :new
    end

  end

  private 

  def sign_up_create_params 
    params.permit(:email, :first_name, :last_name, :phone_number, :password, :zip_code, :width, :height, :length)
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