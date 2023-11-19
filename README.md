# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_kananame      | string | null: false |
| first_kananame     | string | null: false |
| birth_year         | string | null: false |
| birth_month        | string | null: false |
| birth_day          | string | null: false |

### Association

- has_many :products
- has_many :records
- has_many :addresses, through: :records

##  products テーブル

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| seller_id          | references | null: false, foreign_key: true |
| buyer_id           | references | null: false, foreign_key: true |
| product_name       | string     | null: false |
| product_description| text       | null: false |
| category           | string     | null: false |
| condition          | string     | null: false |
| shipping_fee       | string     | null: false |
| origin_region      | string     | null: false |
| sales_price        | decimal    | null: false |


### Association

-  belongs_to :seller, class_name: 'User'
-  belongs_to :buyer, class_name: 'User', optional: true

## records テーブル

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| buyer_id   | references | null: false, foreign_key: true |
| product_id | references | null: false, foreign_key: true |

### Association

-  belongs_to :buyer, class_name: 'User'
-  belongs_to :product
-  has_one :address, dependent: :destroy

## adresss テーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| record_id  | references | null: false, foreign_key: true |
| postal_code| string       | null: false |
| prefecture | string     | null: false |
| city       | string     | null: false |
| street_address      | string     | null: false |
| building_name      | string     |
| phone_number      | decimal    | null: false |

### Association

- belongs_to :record
