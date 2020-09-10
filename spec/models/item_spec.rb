require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '出品登録' do
    before do
      @item = FactoryBot.build(:item)
    end
    
    it 'すべての値が正しく入力されていれば保存できること' do
    end
    it 'ログインしていないユーザーは出品ページへ遷移できない' do
    end
    it '画像を１枚アップしていなければ出品登録できない' do
    end
    it '商品名を登録していなければ出品登録できない' do
    end
    it '商品の説明を空欄では登録できない' do
    end
    it 'カテゴリー情報がなければ出品登録はできない' do
    end
    it '商品の状態についての情報がなければ出品登録できない' do
    end
    it '配送料の負担についての情報がなければ出品登録できない' do
    end
    it '発送元の地域についての情報がなければ出品登録できない' do
    end
    it '発送までの日数についての情報がなければ出品登録できない' do
    end
    it '価格が、¥300未満であれば出品登録できない' do
    end
    it '価格が、¥9,999,999よりも上であれば出品登録できない' do
    end
    it '販売価格の入力は半角数字でなければ出品登録できない' do
    end
    it '入力された販売価格によって、非同期的に販売手数料や販売利益が変わることに不備があったら、出品登録できない' do
    end
  end
end