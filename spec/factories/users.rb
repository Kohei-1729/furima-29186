FactoryBot.define do
  factory :user do
    nickname { 'Furima太郎' }
    email { 'test@test' }
    password { 'aa000000'}
    confirmation_password { 'aa000000' }
    last_name { '振馬' }
    first_name { '太郎' }
    last_name_kana { 'フリマ' }
    first_name_kana { 'タロウ' }
    birth-date { '1990-07-10'}
  end
end
