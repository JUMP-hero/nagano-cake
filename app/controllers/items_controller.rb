class ItemsController < ApplicationController
  before_action :set_item, only: [:show]


  def index
    @items = admin_items_index
  end

  def show
    @item = admin_show_item_url

  end

  private
  
  def set_item
    @item = Item.find(params[:id])
  end



end