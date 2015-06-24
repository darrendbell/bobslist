class ItemsController < ApplicationController
  before_action :find_time, only:, [:edit, :show, :update, :destroy]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create 
  end

  def edit
    #find_item
  end

  def update
    if @item.update(item_params)
      flash[:notice] = "#{@item.name} updated successfully."
      reject_to(action: :index)
    else
      flash[:error] = "#{@item.name} failed to update."
      render :edit
    end
  end

  def show
    #find_item
  end

  def destroy
    if @item.destroy
      flash[:notice] = "#{@item.name} has been deleted."
      redirect_to(action: :index)
    else
      flash[:error] = "#{@item.name} failed to be deleted."
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id)
  end

  def find_item
    @item = Item.find_by(id: params[:id])
    unless @video
      render(text: "video with id #{params[:id]} not found", status: :404)
    end
  end
end
