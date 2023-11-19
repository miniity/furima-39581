# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_kananame      | string | null: false |
| first_kananame     | string | null: false |
| birthday           | data   | null: false |


### Association

- has_many :products
- has_many :records

##  products テーブル

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| user               | references | null: false, foreign_key: true |
| product_name       | string     | null: false |
| product_description| text       | null: false |
| category_id        | integer    | null: false |
| condition_id       | integer    | null: false |
| shipping_fee_id    | integer    | null: false |
| origin_region_id   | integer    | null: false |
| shipping_days_id   | integer    | null: false |
| sales_price        | decimal    | null: false |


### Association

-  belongs_to :user

## records テーブル

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| product    | references | null: false, foreign_key: true |

### Association

-  belongs_to :user
-  belongs_to :product
-  has_one :address

## adresss テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| record_id     | references | null: false, foreign_key: true |
| postal_code   | string     | null: false |
| prefecture    | integer    | null: false |
| city          | string     | null: false |
| street_address| string     | null: false |
| building_name | string     |
| phone_number  | string     | null: false |

### Association

- belongs_to :record
