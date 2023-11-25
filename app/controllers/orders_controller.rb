class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def donation_params
    params.require(:order_address).permit(:postal_code, :prefecture, :city, :street_address, :building_name, :phone_number :item_id).merge(user_id: current_user.id)
  end

end

