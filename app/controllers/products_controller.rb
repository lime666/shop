class ProductsController < ApplicationController
  before_action :set_category, only: :index

  def index
  	@products = Products.all
  end

  def show
  	@product = Product.find(params[:id])
  end

  def search
    @products = Product.where('title ILIKE ? or description ILIKE ?', "%#{params[:q]}%", "%#{params[:q]}%")
    render 'index'
  end


  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end

  def set_category
  	@category = Category.find(params[:category_id])
  end
end
