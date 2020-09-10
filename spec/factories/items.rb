FactoryBot.define do
  factory :item do
    name { '長靴' }
    description { "aaaaa"}
    category_id { 1 }
    condition_id { 1 }
    postage_payer_id { 1 }
    prefecture_id { 1 }
    handling_time_id { 1 }
    price { 500 }
    association :user
  end
end
