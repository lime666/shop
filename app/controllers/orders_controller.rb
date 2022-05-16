# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: :update

  def show
    @order_items = current_order.order_items
  end

  def update
    @order.ordered!
    OrderMailer.with(user: current_user).complete_order.deliver_now
    redirect_to root_path, notice: 'Ordered successfully'
  end

  private

  def set_order
    @order = current_order
  end
end
