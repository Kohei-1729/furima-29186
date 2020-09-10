class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :handling_time

  
  validates :category_id, numericality: { other_than: 0, message: "Select" }
  validates :condition_id, numericality: { other_than: 0, message: "Info can't be blank" }
  validates :postage_payer_id, numericality: { other_than: 0, message: " and Shipping fee status Select" }
  validates :prefecture_id, numericality: { other_than: 0, message: "Select" }
  validates :handling_time_id, numericality: { other_than: 0, message: "Select" }
end
