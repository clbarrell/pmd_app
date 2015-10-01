class UsersController < ApplicationController
  before_filter :authenticate_user!

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
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