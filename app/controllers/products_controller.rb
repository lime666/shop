class ProductsController < ApplicationController
  #before_action :set_category, only: :index
  
  def index
  	@products = Product.all.page params[:page]
    @categories = Category.all
    @sort_by = params[:sort_by]
    if @sort_by == 'Sort A-Z'
      @products = @products.sort_by_title_asc
    elsif @sort_by == 'Sort Z-A'
      @products = @products.sort_by_title_desc
    elsif @sort_by =='Price Low to High'
      @products = @products.sort_by_price_asc
    elsif @sort_by =='Price High to Low'
      @products = @products.sort_by_price_desc
    end
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
