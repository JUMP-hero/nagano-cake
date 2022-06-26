class Public::AddressesController < ApplicationController

  before_action :set_address, only: [:edit, :update, :destroy]

  def index
    @address = Address.all
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to addresses_path
    else
      @address = Address.all
      render 'index'
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    @address.destroy
    redirect_to addresses_path
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:post_code, :address, :customer_name, :customer_id)
  end
end


