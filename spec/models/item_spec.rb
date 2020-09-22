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
      expect(@item.errors.full_messages).to include("画像を入力してください")
    end
    it '商品名を登録していなければ出品登録できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end
    it '商品の説明を空欄では登録できない' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("「商品の説明」を入力してください")
    end
    it 'カテゴリー情報がなければ出品登録はできない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
    end
    it 'カテゴリー情報の選択肢の中で、初期値を選択した場合出品できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
    end
    it '商品の状態についての情報がなければ出品登録できない' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("「商品の状態」を入力してください")
    end
    it '商品の状態についての選択肢の中で、初期値を選択した場合出品できない' do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("「商品の状態」を選択してください")
    end
    it '配送料の負担についての情報がなければ出品登録できない' do
      @item.postage_payer_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("「配送料の負担」を入力してください")
    end
    it '配送料の負担についての選択肢の中で、初期値を選択した場合出品できない' do
      @item.postage_payer_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("「配送料の負担」を選択してください")
    end
    it '発送元の地域についての情報がなければ出品登録できない' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("「発送元の地域」を入力してください")
    end
    it '発送元の地域についての選択肢の中で、初期値を選択した場合出品できない' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("「発送元の地域」を選択してください")
    end
    it '発送までの日数についての情報がなければ出品登録できない' do
      @item.handling_time_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("「発送までの日数」を入力してください")
    end
    it '発送までの日数についての選択肢の中で、初期値を選択した場合出品できない' do
      @item.handling_time_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("「発送までの日数」を選択してください")
    end
    it '販売価格が、空欄であれば出品登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格を入力してください")
    end
    it '販売価格が、¥300未満であれば出品登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格にご注意ください（300円以上です）")
    end
    it '販売価格が、¥9,999,999よりも上であれば出品登録できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格にご注意ください（10,000,000円未満です）")
    end
    it '販売価格の入力は半角数字でなければ出品登録できない' do
      @item.price = "５００"
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格にご注意ください（300円以上です）")
    end
  end
end