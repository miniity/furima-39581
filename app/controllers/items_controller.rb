class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]

  def index
    @items = Item.order(created_at: :desc)
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
      puts 'Form Data:'
      puts item_params.inspect
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:item_id])
    item.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      puts 'Form Data:'
      puts item_params.inspect
      render 'edit', status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :product_description, :category_id, :condition_id, :shipping_fee_id,
                                 :prefecture_id, :shipping_day_id, :sales_price)
  end

  def check_user
    if user_signed_in?
      return if current_user == @item.user

      redirect_to root_path

    else
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
