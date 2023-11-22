FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.free_email }
    password   { 'password1' }
    password_confirmation { password }
    first_name { '太郎' }
    last_name { '山田' }
    first_kananame { 'タロウ' }
    last_kananame { 'ヤマダ' }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2017-12-31') }
  end
end
