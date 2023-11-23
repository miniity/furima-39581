class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_day, class_name: 'ShippingDay', foreign_key: 'shipping_day_id'
  belongs_to :shipping_fee, class_name: 'ShippingFee', foreign_key: 'shipping_fee_id'

  validates :image, presence: true
  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_day_id, presence: true
  validates :sales_price, presence: true, numericality: { only_integer: true }
  validates :sales_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  # ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shipping_day_id, numericality: { other_than: 1 }
  validates :shipping_fee_id, numericality: { other_than: 1 }

  belongs_to :user
end
