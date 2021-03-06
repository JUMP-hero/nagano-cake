class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    @order = current_customer.orders.new(order_params)
    @cart_items = CartItem.all
    if @order.save
      @cart_items.each do |cart_item|
      @order_item = OrderItem.new
      @order_item.item_id = cart_item.item_id
      @order_item.order_id = @order.id
      @order_item.quantity = cart_item.quantity
      @order_item.price = cart_item.item.price
      @order_item.save
      end
      redirect_to complete_orders_path
      @cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def confirm
    @order = Order.new(order_params)
    @order.postage = 800

    # 商品の合計額

    #　newページで選択した住所の表示
    #　自身の住所
    if params[:order][:address_id] =="1"
      @order = Order.new(order_params)
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.address_name = current_customer.last_name + current_customer.first_name


    #登録済の住所
    elsif params[:order][:address_id] == "2"
      @address = Address.find(params[:order][:address_id])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.address_name = @address.customer_name

    elsif params[:order][:address_id] == "3"
      address_new = current_customer.addresses.new(address_params)
      if address_new.save

      else
        redirect_to root_path
      end
    end

    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.quantity }


  end

  def complete
  end

  def index
    @orders = Order.all

  end

  def show
    @order = Order.find(params[:id])

  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :total_amount, :post_code, :address, :address_name, :postage, :order_status)
  end
end