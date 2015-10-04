class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  def new

    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def index
    @projects = Project.all
    @project = @projects.first

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
    @project = Project.new(project_params)

    # need a method to automatically assign job numnber
    @project.newjobnum

    if @project.save
      # when save is successful
      flash["notice"] = "New project created: #{@project.name}."
      redirect_to new_project_project_split_path(@project)
    else
      render new_project_path
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:success] = "Project updated"
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    # Note the splits will automatically be deleted from DB too
    @project = Project.find(params[:id])
    @project.destroy
    flash[:success] = "Project successfully deleted."
    redirect_to projects_path
  end

  # To update the contact select input on _form
  def update_contacts
    # Idea from here: https://github.com/bmarcot/dynamic-select-boxes
    @contacts = Contact.select(:name).where("client_id = ?", params[:client_id])
    respond_to do |format|
      format.js
      format.json { render json: @contacts }
    end
  end

  # GET /projects/:id
  def show
    @project = Project.find(params[:id])
    @project_splits = @project.project_splits.all
  end

  private
    # Define the params that can be sent
    def project_params
      params.require(:project).permit(:name, :job_number, :total, :probability, :service_line, :status, :project_type, :suitable_reference, :client_id, :contact_id, project_splits_attributes: [:user_id, :project_id, :role, :percentage] )
    end
end
