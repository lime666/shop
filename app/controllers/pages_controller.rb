class PagesController < ApplicationController
  def home
    @products = Product.order('created_at DESC').page params[:page]
  end

  def contacts
    render 'contacts'
  end


  def all_products
    @products = Product.all
  end

end
