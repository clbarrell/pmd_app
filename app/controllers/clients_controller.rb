class ClientsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @client = Client.new
  end

  def show
    @client = Client.find(params[:id])
  end

  def edit
    @client = Client.find(params[:id])
  end

  def index
    @clients = Client.all
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      flash[:success] = "Client successfully updated."
      redirect_to @client
    else
      render 'edit'
    end
  end

  def destroy
    # Find the client first
    @client = Client.find(params[:id])
    @client.destroy
    flash[:success] = "Client successfully deleted."
    redirect_to clients_path
  end

  def create
    @client = Client.new(client_params)
    if @client.save # when save is successful
      flash["notice"] = "New client created."
      redirect_to @client
    else
      render "new"
    end
  end

  private

    def client_params
      params.require(:client).permit(:name, :organisation_id)
    end
end
