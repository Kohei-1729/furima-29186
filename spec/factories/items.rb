FactoryBot.define do
  factory :item do
    image {Faker::Lorem.sentence}
    name { '長靴' }
    description {Faker::Lorem.sentence}
    category_id { 'メンズ' }
    condition_id { 'やや傷や汚れあり' }
    postage_payer_id { '着払い(購入者負担)' }
    prefecture_id { '山口県' }
    handling_time_id { '1~2日で発送' }
    price { '500'}
    association :user
  end
end
