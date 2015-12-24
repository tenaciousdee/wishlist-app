class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)
    redirect_to "/lists/#{@list.id}"
  end

  def show
    @list = List.find_by(id: params[:id])
  end

  def edit
    @list = List.find_by(id: params[:id])
  end

  def update
    @list = List.find_by(id: params[:id])
    @list.update(list_params)
    redirect_to "/lists/#{@list.id}"
  end

  def destroy
    @list = List.find_by(id: params[:id])
    @list.update(active: false)
    redirect_to "/lists"
  end

  private

  def list_params
    params.require(:list).permit(:name, :description)
  end
end
