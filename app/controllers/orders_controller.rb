class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @order_address = Order.new

    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @order = Order.create(user_id: current_user.id)
    Address.create(address_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def address_params
    params.permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(user_id: current_user.id)
  end


end

