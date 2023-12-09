class OrdersController < ApplicationController
  attr_accessor :token
  before_action :authenticate_user!, only: [:index, :create]
  before_action :check_seller, only: [:index, :create]

  def index
    setup_order_form
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)

    if @order_address.valid?
      process_payment
      @order_address.save
      redirect_to root_path
    else
      setup_order_form
      render :index, status: :unprocessable_entity
    end
  end

  private

  def setup_order_form
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def process_payment
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.sales_price,  
      card: order_params[:token], 
      currency: 'jpy'   
    )
  end

  def check_seller
    item = Item.find(params[:item_id])

    unless user_signed_in?
      redirect_to new_user_session_path
      return
    end

    if current_user == item.user || item.sold_out?
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end
end
