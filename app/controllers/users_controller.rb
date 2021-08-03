class UsersController < ApplicationController
  before_action :authenticate_user!
  def index 
    # if user.admin 
    # render 'dashboard/index'
    #  else 
    # render 'users/dashboard'
  end

  def show

  end

end