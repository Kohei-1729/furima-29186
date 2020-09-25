require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入の保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_address).to be_valid
    end
    it '郵便番号が空だと保存できないこと' do
      @purchase_address.zip_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("郵便番号を入力してください")
    end
    it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_address.zip_code = 'aaaa'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("郵便番号を-（ハイフン）も含めて入力してください")
    end
    it '郵便番号が半角のハイフンを含んだ正しい形式(3桁-4桁)でないと保存できないこと' do
      @purchase_address.zip_code = '12-3234'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("郵便番号を-（ハイフン）も含めて入力してください")
    end
    it '都道府県についての選択肢の中で、初期値を選択した場合出品できない' do
      @purchase_address.prefecture_id = 0
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("都道府県を選択してください")
    end
    it '市区町村が空だと保存できないこと' do
      @purchase_address.city = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("市区町村名を入力してください")
    end
    it '市区町村が全角日本語でないと保存できないこと' do
      @purchase_address.city = "aaaaa"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("市区町村名を入力してください")
    end
    it '番地が空だと保存できないこと' do
      @purchase_address.street_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("番地名を入力してください")
    end
    it '電話番号が空だと保存できないこと' do
      @purchase_address.phone_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("電話番号を入力してください")
    end
    it '電話番号は11桁の半角数字でないと保存できないこと' do
      @purchase_address.phone_number = "aaaaa"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("電話番号を入力してください")
    end
    it 'クレジットカード情報は必須であり、正しいクレジットカードの情報で無いときは決済できないこと' do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("カード情報を入力してください")
    end
  end
end
