class Public::ItemsController < ApplicationController
 before_action :set_item, only: [:show]

  def index
    @items = Item.all
  end

  def show
   @cart_item = CartItem.new
  end

  private

  def set_item
    @item = Items.find(params[:id])
  end

  def cart_item_params
   params.require(:cart_item).permit(:item_id, :count)
  end

end