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
    @client = Client.new(client__params)
    if @client.save # when save is successful
      flash["notice"] = "New client created."
      redirect_to clients_path
    else
      render "new"
    end
  end

  private

    def client__params
      params.require(:client).permit(:name, :organisation_id)
    end
end
