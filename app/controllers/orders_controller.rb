class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @items = current_order.order_items
  end
end
