class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  FULL_WID_CHAR = /\A[ぁ-んァ-ン一-龥]/
  ERROR_WID = 'を全角で入力してください'
  FULL_WID_KANA = /\A[ァ-ヶー－]+\z/
  ERROR_WID_KANA = 'を全角カナで入力してください'

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: FULL_WID_CHAR, message: ERROR_WID }
    validates :first_name, format: { with: FULL_WID_CHAR, message: ERROR_WID }
    validates :last_name_kana, format: { with: FULL_WID_KANA, message: ERROR_WID_KANA}
    validates :first_name_kana, format: { with: FULL_WID_KANA, message: ERROR_WID_KANA}
    validates :birth_date
  end

  has_many :items
  has_many :purchases
  has_many :favorites
end
