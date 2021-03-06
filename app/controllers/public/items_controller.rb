class Public::ItemsController < ApplicationController
 before_action :redirect_root, except: :index

  def index
    @items = Item.page(params[:page])
  end

  def show
   @item = Item.find(params[:id])
   @cart_item = CartItem.new
  end

  private

  def redirect_root
  redirect_to root_path unless customer_signed_in?
  end

  def cart_item_params
   params.require(:cart_item).permit(:item_id, :quantity)
  end

end