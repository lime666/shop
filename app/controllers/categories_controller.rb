class CategoriesController < ApplicationController
  def index
  	@categories = Category.where(parent_id: nil).order(:title)
  end

  def show
    @category = Category.find(params[:id])
    @categories = @category.parent
    @products = @category.products.order('created_at DESC').page params[:page]
  end

  private

  def category_params
    params.require(:category).permit(:title, :id)
  end
end
