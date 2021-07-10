class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]
  
  def new
    @category = Category.new
  end
  
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was successfully created!"
      redirect_to @category
    else
      render 'new'
    end
  end

  
  def index
    @categories = Category.all
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def show
    @category = Category.find(params[:id]) #initiating created category to show page
    @articles = @category.articles
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
        #Giver besked efter man har trykket update
       flash[:notice] = "Category was updated successfully!"
       redirect_to categories_path(@category)
      else
       render 'edit'
      end
  end
  
  private
  
  def category_params
    params.require(:category).permit(:name)
  end
  
  def require_admin
    if !(logged_in? && current_user.admin?)
    flash[:alert] = "Only admin can beform that action"
      redirect_to categories_path
    end
  end
  
end
