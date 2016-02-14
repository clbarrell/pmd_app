class UsersController < ApplicationController
  before_filter :authenticate_user!

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])

    #Splits for the tables
    @project_splits = @user.project_splits.all if @user.project_splits.any?
    @coordinator_projects = @project_splits.where(role: "Coordinator") || "" if @user.project_splits.any?
    @sales_projects = @project_splits.where(role: "Sales") || "" if @user.project_splits.any?
    @involved_projects = @project_splits.where(role: "Involved") || "" if @user.project_splits.any?

    # Eventualyl want to work otu money amounts for this year - and focus only on active projects

  end

  def create
    # DEVISE
  end

  # to delete users / admin only DEVISE
  def destroy
  end

  def update
    # Update is sent through devise

  end

  def edit
  end

  def index
    @users = User.all
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :initials, :admin)
    end
end