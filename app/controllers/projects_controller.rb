class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
  end

  def index
    @projects = Project.all
    # Respond to the param status
    case params[:status]
      when "active"
        @projects = @projects.where(status: "Active")
      when "inactive"
        #Filter all the inactive proj types
        @projects = @projects.where(status: ["Complete","Inactive","Delayed"])
      else
        @projects
    end
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
  end

  private
    # Define the params that can be sent
    def project_params
      params.require(:project).permit(:name, :job_number, :total, :probability, :service_line, :status, :project_type, :suitable_reference, :client_id, :contact_id)
    end
end
