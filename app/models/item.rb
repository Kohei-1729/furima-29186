class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase

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

  with_options numericality: { other_than: 0, message: "を選択してください" } do
    validates :category_id
    validates :prefecture_id
    validates :handling_time_id
  end

  validates :condition_id, numericality: { other_than: 0, message: "を選択してください" }
  validates :postage_payer_id, numericality: { other_than: 0, message: "を選択してください" }
  validates :price, numericality: { greater_than_or_equal_to: 300, message: "にご注意ください（300円以上です）"}
  validates :price, numericality: { less_than: 10000000, message: "にご注意ください（10,000,000円未満です）"}
  validates :price, format: { with: /\A[0-9]+\z/, message: "は半角数字で入力ください" }

  def previous
    Item.where("id < ?", self.id).order("id DESC").first
  end

  def next
    Item.where("id > ?", self.id).order("id ASC").first
  end
end
