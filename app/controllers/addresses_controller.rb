class AddressesController < ApplicationController

  def index
    @address = Address.all
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to addresses_path
    else
      @address = Address.new
      render 'index'
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.permit(:post_code, :address, :name, :customer_id)
  end
end