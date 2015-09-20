class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    if @contact.save # when save is successful
      flash["notice"] = "New contact created."
      redirect_to contacts_path
    else
      render "new"
    end
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

    def contact_params
      params.require(:contact).permit(:name, :client_id)
    end

end
