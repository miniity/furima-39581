FactoryBot.define do
  factory :order_address do
    postal_code { '123-1234' }
    prefecture_id { 3 }
    city { '横浜市緑区' }
    street_address { '3-4' }
    building_name { 'テストビル' }
    phone_number { '09012341234' }
    token {"tok_abcdefghijk00000000000000000"}

  end
end

