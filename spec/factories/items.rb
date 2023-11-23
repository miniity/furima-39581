FactoryBot.define do
  factory :item do
    product_name { 'あああ' }
    product_description { 'あいうえお' }
    category_id { rand(2..10) }  # ランダムな値を設定
    condition_id { rand(2..5) }  # ランダムな値を設定
    shipping_fee_id { rand(2..3) }  # ランダムな値を設定
    prefecture_id { rand(2..47) }  # ランダムな値を設定
    shipping_day_id { rand(2..3) }  # ランダムな値を設定
    sales_price { '500' }
    association :user, factory: :user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
