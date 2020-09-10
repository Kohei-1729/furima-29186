require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品登録' do
    before do
      @user = FactoryBot.build(:user)
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.jpg')
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end
    it '画像を１枚アップしていなければ出品登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名を登録していなければ出品登録できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明を空欄では登録できない' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'カテゴリー情報がなければ出品登録はできない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end
    it '商品の状態についての情報がなければ出品登録できない' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition Info can't be blank")
    end
    it '配送料の負担についての情報がなければ出品登録できない' do
      @item.postage_payer = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage payer  and Shipping fee status Select")
    end
    it '発送元の地域についての情報がなければ出品登録できない' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture Select")
    end
    it '発送までの日数についての情報がなければ出品登録できない' do
      @item.handling_time_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Handling time Select")
    end
    it '販売価格が、空欄であれば出品登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
  end
end