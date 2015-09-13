class ContactsController < ApplicationController
  def create
    @contact = Contact.new(user_params)
    if @contact.save # when signup is successful
      flash[:info] = "Contact saved successfully."
      redirect_to root_url
    else
      render "new"
    end
  end  

  def destroy
    Contact.find(params[:id]).destroy
    flash[:success] = "Contact Deleted"
    redirect_to users_
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
    
  end
  
end
