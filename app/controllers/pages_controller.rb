class PagesController < ApplicationController
  def home
    @products = Product.order('created_at DESC').page params[:page]
  end

end
