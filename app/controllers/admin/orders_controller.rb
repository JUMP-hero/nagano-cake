class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @total = 0
  end
  def update
    if @order.update(order_params)
      redirect_to admin_order_path(@order), notice: "対応ステータスを更新しました"
    else
      render :show, alert: "対応ステータスを更新できませんでした"
    end
  end
end
