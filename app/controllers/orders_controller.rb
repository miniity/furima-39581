class OrdersController < ApplicationController
  attr_accessor :token
  before_action :authenticate_user!, except: :index

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
#      puts 'Form Data:'
#      puts item_params.inspect
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end
end
