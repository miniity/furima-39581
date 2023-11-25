class DonationAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :order, :postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :order
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id
    validates :city
    validates :street_address
    validates :phone_number
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    # 購入情報を保存し、変数orderに代入する
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, street_address: street_address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
