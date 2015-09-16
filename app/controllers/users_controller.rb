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
  #  @user = User.new(user_params)
  #  if @user.save # when signup is successful
  #    @user.send_activation_email
  #    flash[:info] = "Please check your email to activate your account."
  #    redirect_to root_url
  #  else
  #    render "new"
  #  end
  end

  # to delete users / admin only DEVISE
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Deleted"
    redirect_to users_url
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