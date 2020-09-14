FactoryBot.define do
  factory :purchase_address do
    zip_code { '111-1111' }
    prefecture_id { 1 }
    city { 'ああああ' }
    street_number { 'かかか3-3' }
    building_name { 'ははは303' }
    phone_number { 12345678901 }
  end
end
