class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :handling_time

  
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :handling_time_id
    validates :price
  end

  with_options numericality: { other_than: 0, message: "Select" } do
    validates :category_id
    validates :prefecture_id
    validates :handling_time_id
  end

  PRICE_RANGE = "Out of setting range"
  validates :condition_id, numericality: { other_than: 0, message: "Info can't be blank" }
  validates :postage_payer_id, numericality: { other_than: 0, message: " and Shipping fee status Select" }
  validates :price, numericality: { greater_than_or_equal_to: 300, message: PRICE_RANGE}
  validates :price, numericality: { less_than: 10000000, message: PRICE_RANGE}
  validates :price, format: { with: /\A[0-9]+\z/, message: "Half-width number" }
end
