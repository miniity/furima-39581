class OrdersController < ApplicationController
  attr_accessor :token
  before_action :authenticate_user!, only: [:index, :create]
  before_action :check_seller, only: [:index, :create]


  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
  
    if @order_address.valid?

      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.sales_price,  
        card: order_params[:token], 
        currency: 'jpy'   
      )

      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end
  
  private
  def check_seller
    item = Item.find(params[:item_id])

    unless user_signed_in?
      redirect_to new_user_session_path
      return
    end

    if current_user == item.user || item.sold?
      redirect_to root_path
      return
    else
      return true
    end
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end
end
