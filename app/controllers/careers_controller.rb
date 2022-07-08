class CareersController < ApplicationController
  before_action :require_admin, :only => [:show]
  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_create_params)
    if @candidate.save
      redirect_to root_path, notice: 'Success! You entered your information successfully. Now wait for a call from a manager to do a quick phone interview.'
      # flash[:candidate] = @candidate.name

    else
      flash.now[:alert] = "Invalid Input! Your info was not saved. Go over your entries and try again. "
      flash.now[:color] = "invalid"
      render :action => "new"
    end
  end

  def show
    @candidate = Candidate.find(params[:id])
    
  end

  private 
  def candidate_create_params 
    params.require(:candidate).permit(:position, :name, :age, :phone_number, :address, :zip_code)
  end

  def require_admin
    unless user_signed_in? && current_user.admin?
      raise 'not authorized'
      redirect_to new_user_session_path
    end
  end
end
