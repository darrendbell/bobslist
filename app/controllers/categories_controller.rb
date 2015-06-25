class CategoriesController < ApplicationController
   before_action :find_category, only: [:show, :edit, :update, :destroy]
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create 
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "#{@category.name} created!"
      redirect_to categories_path
    else
      flash[:error] = "#{@ite.name} failed to be created."
      render :new
    end
  end

   def update
   if @category.update(category_params)
     flash[:notice] = "#{@category.name} was updated"
   else
     flash[:error] = "#{@category.name} was not updated"
   end
   redirect_to(action: :index)
 end

 def show
    @items = Item.where(category_id: @category.id)
 end

 def destroy
   if @category.destroy
     flash[:notice] = "category was destroyed"
   else
     flash[:error] = "category was not destroyed"
   end
   redirect_to(categories_path)
 end

 private

 def find_category
   @category = Category.find_by(id: params[:id])
   unless @category
     render(text: "category not found with id: #{params[:id]}", status: '404')
   end
 end

 def category_params
   params.require(:category).permit(:name )
 end

end


