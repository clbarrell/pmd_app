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
    # All the status param to show up in view
    @filter_status = params[:status] || "all"
    if params[:status] == "inactive"
      @filter_status = "Delayed, Complete, and Inactive"
    end
  end


  private
    # Define the params that can be sent
    def project_params
      params.require(:project).permit(:name, :job_number, :total, :probability, :service_line, :status, :project_type, :suitable_reference, :client_id, :contact_id)
    end
end
