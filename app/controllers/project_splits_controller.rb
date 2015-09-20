class ProjectSplitsController < ApplicationController

  # GET /projects/:project_id/comments
  def index
    # Find the project first, then the splits
    project = Project.find(params[:project_id])
    @project_splits = project.project_splits

  end

  # POST /projects/:project_id/comments
  def create
    # Find the project first, then the split
    @project = Project.find(params[:project_id])
    @project_split = @project.project_splits.create(project_split_params)

    if @project_split.save # when save is successful
      flash["notice"] = "New Project Split created."

      #Do they want to add more splits??
      if @project_split.anymore == "true"
        # Redirect to the split's project once completed
        redirect_to new_project_project_split_path(@project)
      else
        redirect_to @project
      end
    else
      render 'new'
    end
  end

  def new
    # Find the project first, then the split
    @project = Project.find(params[:project_id])
    @project_split = @project.project_splits.build
  end

  # GET /projects/:project_id/comments/:id
  def show
    # Find the project first, then the split
    project = Project.find(params[:project_id])
    @project_split = project.project_splits.find(params[:id])
  end

  def edit
    # Find the project first, then the splits
    @project = Project.find(params[:project_id])
    @project_split = @project.project_splits.find(params[:id])
  end

  def update
    if @project_split.update(project_split_params)
      flash[:success] = "Project Split Updated"
      redirect_to project_project_splits_path(@project_split.project)
    else
      render edit_project_project_split(@project_split)
    end
  end

  def destroy
    # Find the project first, then the split
    project = Project.find(params[:project_id])
    @project_split = project.project_splits.find(params[:id])
    @project_split.destroy
    flash[:success] = "Project Split Deleted"
    redirect_to project_project_splits_path(project)
  end

  private

    def project_split_params
      params.require(:project_split).permit(:user_id, :project_id, :role, :percentage, :anymore)
    end


end
