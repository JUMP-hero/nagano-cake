class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @total = 0
  end
  def update
    @order.update(order_params)
    redirect_to admin_order_path(@order)
  end
end
