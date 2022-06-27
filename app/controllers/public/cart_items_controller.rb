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
  end
  def destroy_all
  end
  def update
  end

  private

  def item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :quantity)
  end

end
