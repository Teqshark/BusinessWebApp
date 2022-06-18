class DashboardController < ApplicationController
  protect_from_forgery
  before_action :authenticate_user!, :get_user, 
  # :set_projects

  
  # GET /dashboard or 
  # GET /dashboard.json

  def index
    # set projects by searching all projects where user_id = current_user.id 
    # @projects = Project.where(user_id: current_user.id)

    # set projects by using set user @user object
    @projects = @user.projects
  end

  # GET /projects/1
  # GET /projects/1.json
  def show 
    # @project = Project.find(params[:id])
    @projects = Project.all 
    # puts @project
    @project = @projects.find(params[:id])
    # render json: @project.to_json(include: [:user, :projct])
  end


  # GET /projects/new
  def new
    # user = current_user
    # @project = Project.new
      # client = Clinet.find(some_id) 
      # If you using resources just take id from params  
    @project = @user.projects.build
  end

  # get /proejcts/list
  # def list 
  #   # this list eeryones projects 
  #   # list only my projects unless admin 
  #   @projects = Project.all 
  # end
  # def editAttr 
  #   @project = 
  #   @project.
  # end 
  # GET /projects/edit 
  def edit  
    # @project = @projects.find(:id)
    # @project = @user.projects.find()
    # @user
    # projects = projects.find(:id)
      # project = projects.find(id)
      # puts :id 
      # puts 'logged id'
      @projects = Project.all 
      # puts @project
      @project = @projects.find(params[:id])
      # puts @project

      
      # console.log(:id);
  end
 

  # POST /projects
  # POST /proejcts.json
  def create 
    #  @projects = Project.where(user_id: current_user.id)
    # @project = Project.new(project_params)
    @project = @user.projects.build(project_params)
    # build vs create ; create is build and save combined; '.save' below

    # puts 'printing project object '
    # puts @project 
    # puts 'printing project errors'
    # puts @project.errors.inspect

    if @project.save 
      puts 'project saved'
      flash.now[:notice] = "project successfully created"  
      redirect_to dashboard_index_url
    else 
      puts 'project unable to save'
      flash.now[:alert] = "warning: project was not saved"
      render 'index'
    end

    rescue 
      ActiveRecord::NestedAttributes::TooManyRecords
      flash.now[:error] = 'you have reached the 10 project limit'
      flash.now[:notice] = 'delete a project before you try to add another project'
      flash.now["notice"] = "Test notice"

    # not working didn't no user_projects_path and //no :id provided when ran. //becaue this is not projectsController?? its dashboardController
    # respond_to do |format|
    #   if @project.save  
    #      format.html { redirect_to user_projects_path(@user), notice: 'Post was successfully created.' }
    #      format.json { render :show, status: :created, location: @project }
    #   else
    #      format.html { render :new }
    #      format.json { render json: @project.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATHC/PUT /projects/1
  # PATHC/PUT /projects/1.json
  def update 
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash.now[:notice] = "project successfully update"
      redirect_to dashboard_index_url
    else
      flash.now[:notice] = "project could not be saved"
      redirect_to :back
    end
  
    rescue ActiveRecord::NestedAttributes::TooManyRecords
    flash.now[:error] = 'you have reached the 10 project limit'
    flash.now[:notice] = 'delete a project before you try to add another project'
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy 
    @project = Project.find(params[:id]) 
    @project.destroy
    flash.now[:notice] = "project was deleted successfully!"
    redirect_to dashboard_index_url 
  end
  # def create 
  #   @project = Project.new(params[:project_params)
  #   if @project.save 
  #     redirect_to :action => 'list', notice: 'your project was succesfully saved' 
  #   else 
  #     render :new, notice: 'your project did not save again, try again'

  
  #   end
  # end
  private
  def  project_params 
    params.require(:project).permit(:length, :height, :width, :street_name, :city, :state, :zip_code, :desired_start_date, :desired_completion_date )
  end

  # sets projects for whole ocntroller 
  # def set_projects 
  #   @projects = @user.projects
  # end

  def get_user 
    # set user because dashboard controller only accessed when user is logged in 
    @user = current_user
  end
    # find user when userid is provided in url
    # @user = User.find(params[:user_id])
   

  
end