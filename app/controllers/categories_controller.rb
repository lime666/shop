class CategoriesController < ApplicationController
  def index
  	@categories = Category.order(:title)
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order('created_at DESC').page params[:page]
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
