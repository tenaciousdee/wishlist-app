class ListsController < ApplicationController
    before_action :authenticate_user!, except: [:show]

  def index
    @lists = current_user.lists
  end

  def new
    @list = List.new
  end

  def create
    @user = current_user

    @list = List.create(list_params)
    @list.set_user!(@user)
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
    @list.destroy
    redirect_to "/lists"
  end

  def public_lists
    @public_lists = List.where(public: true)
  end

  def public_show
    @public_list = List.find_by(id: params[:id])
  end

  private

  def list_params
    params.require(:list).permit(:name, :description)
  end
end
