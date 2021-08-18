class DashboardController < ApplicationController
  protect_from_forgery
  # GET /dashboard or /dashboard.json
  def index
    
    @projects = Project.all
  end

  def new
    # user = current_user
    @project = Project.new
      # client = Clinet.find(some_id) 
      # If you using resources just take id from params  
  # @project = user.projects.build

  end

  def create 
    
    @project = Project.new(project_params)
    @project = current_user.projects.build(project_params)

    puts 'printing project object '
    puts @project 
    puts 'printing project errors'
    puts @project.errors.inspect
    if @project.save 
      puts 'project saved'
      flash[:notice] = "project successfully created"  
      redirect_to dashboard_index_url
    else 
      puts 'project unable to save'
      flash[:notice] = "warning: project was not saved"
     render 'dashboard/index'
    end
    flash["notice"] = "Test notice"
  end

  # def create 
  #   @project = Project.new(params[:project_params)
  #   if @project.save 
  #     redirect_to :action => 'list', notice: 'your project was succesfully saved' 
  #   else 
  #     render :new, notice: 'your project did not save again, try again'

  
  #   end
  # end

  def  project_params 
    params.require(:project).permit(:zip_code, :length, :height, :width )
  end
    def show 
      @project = Project.find(params[:id])
    end

    def list 
      @projects = Project.all 
    end
    def edit 

    end

    def delete 
    end

  
end