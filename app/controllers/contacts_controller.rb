class ContactsController < ApplicationController
  before_filter :authenticate_user!

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
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      flash[:success] = "Contact successfully updated."
      redirect_to @contact
    else
      render 'edit'
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:success] = "Contact successfully deleted."
    redirect_to contacts_path
  end

  def new
    @contact = Contact.new
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def index
    @contacts = Contact.all
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :client_id)
    end

end
