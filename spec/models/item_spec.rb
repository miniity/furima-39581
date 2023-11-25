require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報入力' do
    context '商品情報入力がうまくいかない時' do
      it '全ての値が正しく入力されていれば出品できること' do
        expect(@item).to be_valid
      end
    end

    context '商品情報の入力がうまく行かない時' do
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空だと出品できない' do
        @item.product_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it 'introductionが空だと出品できない' do
        @item.product_description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end

      it 'categoryが未選択だと出品できない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'conditionが未選択だと出品できない' do
        @item.condition = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'shipping_feeが未選択だと出品できない' do
        @item.shipping_fee = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end

      it 'prefectureが未選択だと出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'shipping_dayが未選択だと出品できない' do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it 'sales_priceが空だと出品できない' do
        @item.sales_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales price can't be blank")
      end

      it '価格が¥300未満だと出品できない' do
        @item.sales_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales price must be greater than or equal to 300')
      end

      it '価格が¥10,000,000以上だと出品できない' do
        @item.sales_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales price must be less than or equal to 9999999')
      end

      it 'sales_priceが全角数字だと出品できない' do
        @item.sales_price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales price is not a number')
      end
    end
  end
end
