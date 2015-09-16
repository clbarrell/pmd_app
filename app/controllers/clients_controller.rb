class ClientsController < ApplicationController
  def new
    @client = Client.new
  end

  def show
    @client = Client.find(params[:id])
  end

  def edit
  end

  def index
    @clients = Client.all
  end
  
  def update
  end
  
  def destroy
  end
  
  def create
  end
  
end
