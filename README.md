# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_one :profile
- has_many :item
- has_many :purchase

## profiles テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| last_name       | string     | null: false                    |
| first_name      | string     | null: false                    |
| last_name_kana  | string     | null: false                    |
| first_name_kana | string     | null: false                    |
| birth_year      | integer    | null: false                    |
| birth_month     | integer    | null: false                    |
| birth_date      | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| name          | string     | null: false                    |
| introduction  | text       | null: false                    |
| category      | integer    | null: false                    |
| condition     | integer    | null: false                    |
| postage_payer | integer    | null: false                    |
| prefecture    | integer    | null: false                    |
| handling_time | integer    | null: false                    |
| price         | integer    | null: false                    |
| image_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :image
- has_one :purchase

## images テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| image   | string     | null: false                    |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| zip_code      | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| street_number | string     | null: false                    |
| building_name | string     | default: ""                    |
| phone_number  | integer    | null: false                    |
| purchase_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase