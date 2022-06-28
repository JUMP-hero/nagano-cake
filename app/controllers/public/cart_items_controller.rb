class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @total = 0

  end
  def create
    cart_item = CartItem.new(item_params)
    cart_item.save
    redirect_to cart_items_index_path
  end
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_index_path
  end
  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_index_path
  end
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(item_params)
    redirect_to cart_items_index_path
  end

  private

  def item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :quantity)
  end

end
