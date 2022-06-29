class Public::HomesController < ApplicationController
  def top
    @items = Item.limit(4).order(:created_time) # created_timeの昇順で4件取得
  end

  def about
  end
end
