class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
  
    if @order_address.valid?
      @order_address.save(params,current_user.id)
      redirect_to root_path
    else
#      puts 'Form Data:'
#      puts item_params.inspect
      render :index, status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
