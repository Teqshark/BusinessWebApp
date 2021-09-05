class UsersController < ApplicationController
  before_action :authenticate_user!
  def index 
    @users = User.all
    # if user.admin 
    # render 'dashboard/index'
    #  else 
    # render 'users/dashboard'
  end

  def show
    @user = User.all.find(id)
  end
  def edit 
  end
  

end