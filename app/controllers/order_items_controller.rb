class OrderItemsController < ApplicationController
  before_action :set_order, only: %i[update destroy]

  def create
  	#binding.break
  	@order_item = current_order.order_items.find_by(product_id: params[:product_id])
  	if @order_item
      @order_item.increment!(:quantity)
    else
      @order_item = current_order.order_items.create(product_id: params[:product_id], user: current_user, quantity: 1)
    end
  	redirect_to order_path(current_order)
  end

  def update
   	@order_item.update(quantity: params[:quantity])
   	@order_items = current_order.order_items
  end

  def destroy
  	@order_item.destroy
  end

  private

  def set_order
  	@order_item = current_order.order_items.find_by(product: params[:product_id])
  	@order_items = current_order.order_items
  end

end
