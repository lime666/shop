class ProductsController < ApplicationController
  #before_action :set_category, only: :index
  
  def index
  	@products = Product.all
    @categories = Category.all
    @sort_by = params[:sort_by]
    @order_item = current_order.order_items.new
   
    @products = Product.order_by_type(@sort_by)

    if params[:price_from].present? && params[:price_to].present?
      @products = Product.price_range(params[:price_from], params[:price_to])
    end

    if params[:search]
      @search = params[:search]
      @products = Product.search_by(@search)
    end
    @products = @products.page params[:page]
  end

  def show
  	@product = Product.find(params[:id])
    @comments = @product.comments
    if @product.comments.blank?
      @avarage_rating = 0
    else
      @average_rating = @product.comments.average(:rating)
    end
  end


  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end

  def set_category
  	@category = Category.find(params[:category_id])
  end
end
