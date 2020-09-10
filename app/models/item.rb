class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :handling_time

  SELECT = "Select"

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :postage_payer_id, presence: true
  validates :prefecture_id, presence: true
  validates :handling_time_id, presence: true
  validates :price, presence: true
  validates :category_id, numericality: { other_than: 0, message: SELECT }
  validates :condition_id, numericality: { other_than: 0, message: "Info can't be blank" }
  validates :postage_payer_id, numericality: { other_than: 0, message: " and Shipping fee status Select" }
  validates :prefecture_id, numericality: { other_than: 0, message: SELECT }
  validates :handling_time_id, numericality: { other_than: 0, message: SELECT }
end
