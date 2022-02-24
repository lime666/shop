class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: :update

  def show
    @order_items = current_order.order_items
  end

  def update
    @order.ordered!
    @order.update(order_params)
    redirect_to root_path, notice: "Ordered successfully"
  end

  private
  def set_order
    @order = current_order
  end

  def order_params
    params.require(:order).permit(:status, :user_id)
  end
end
