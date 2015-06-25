class ItemsController < ApplicationController
  before_action :find_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create 
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "#{@item.name} created!"
      redirect_to items_path
    else
      flash[:error] = "#{@ite.name} failed to be created."
      render :new
    end
  end

  def edit
    #find_item
  end

  def update
    if @item.update(item_params)
      flash[:notice] = "#{@item.name} updated successfully."
      redirect_to(action: :index)
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
      render(text: 'item not deleted', status: 400)
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :image)
  end

  def find_item
    @item = Item.find_by(id: params[:id])
    unless @item
      render(text: "item with id #{params[:id]} not found", status: '404')
    end
  end
end
