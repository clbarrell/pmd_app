class ContactsController < ApplicationController
  def create
  end

  def update
  end

  def destroy

  end

  def new
    @contact = Contact.new
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def edit
  end

  def index
    @contacts = Contact.all
  end

  private

    def user_params
     # params.require(:user).permit(:name, :initials, :admin)
    end

end
