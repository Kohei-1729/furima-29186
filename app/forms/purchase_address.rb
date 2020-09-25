class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip_code, :prefecture_id, :city, :street_number, :building_name, :phone_number

  attr_accessor :token
  with_options presence: true do
    validates :zip_code
    validates :prefecture_id
    validates :street_number
    validates :token
  end

  validates :zip_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "を-（ハイフン）も含めて入力してください" }
  validates :prefecture_id, numericality: { other_than: 0, message: "を選択してください" }
  validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "を入力してください" }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "を入力してください"}

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, street_number: street_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end