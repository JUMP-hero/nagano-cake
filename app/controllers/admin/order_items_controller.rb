class Admin::OrderItemsController < ApplicationController

  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update(order_item_params)
      redirect_to admin_order_path
    else
      render :show
    end
  end

  private
  def order_item_params
    params.require(:oeder_item).permit(:produciton_status)
  end
end
