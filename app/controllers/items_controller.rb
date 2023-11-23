class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to root_path
    else
      puts "Form Data:"
      puts item_params.inspect
      render 'new', status: :unprocessable_entity
    end    
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :product_description, :category_id, :condition_id, :shipping_fee_id,
                                 :prefecture_id, :shipping_day_id, :sales_price)
  end
end
