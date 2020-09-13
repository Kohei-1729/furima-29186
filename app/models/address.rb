class Address < ApplicationRecord
  belongs_to :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :zip_code
    validates :prefecture_id
    validates :city
    validates :street_number
    validates :phone_number
  end

  validates :zip_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly" }
  validates :prefecture_id, numericality: { other_than: 0, message: "Select" }
  validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "can't be blank" }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "can't be blank"}
end
