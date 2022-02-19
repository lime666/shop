class ProductsController < ApplicationController
  #before_action :set_category, only: :index
  
  def index
  	@products = Product.all
    @categories = Category.all
    @sort_by = params[:sort_by]
   
    @products = Product.order_by_type(@sort_by)

    if params[:price_from].present? && params[:price_to].present?
      @products = Product.price_range(params[:price_from], params[:price_to])
    end

    if params[:search]
      @search = params[:search]
      @products = Product.search_by(@search)
=begin
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update("search", @products.count)
      end
    end
=end
    end
    @products = @products.page params[:page]
  end

  def show
  	@product = Product.find(params[:id])
  end


  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end

  def set_category
  	@category = Category.find(params[:category_id])
  end
end
