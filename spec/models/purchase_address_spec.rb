require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入の保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
    end
    it '郵便番号が空だと保存できないこと' do
    end
    it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    end
    it '都道府県を選択していないと保存できないこと' do
    end
    it '都道府県についての選択肢の中で、初期値を選択した場合出品できない' do
    end
    it '市区町村が空だと保存できないこと' do
    end
    it '市区町村が全角日本語でないと保存できないこと' do
    end
    it '番地が空だと保存できないこと' do
    end
    it '建物名は空でも保存できること' do
    end
    it '電話番号が空だと保存できないこと' do
    end
    it '電話番号は11桁の半角数字でないと保存できないこと' do
    end
    it 'ログインしていないユーザーは購入ページに遷移しようとすると、ログインページに遷移すること' do
    end
    it '出品者はURLを直接入力して購入ページに遷移しようとすると、トップページに遷移すること' do
    end
    it 'URLを直接入力して購入済み商品の購入ページへ遷移しようとすると、トップページに遷移すること' do
    end
    it 'クレジットカード決済ができる' do
    end
    it 'クレジットカードの情報は購入の都度入力させる' do
    end
    it 'クレジットカード情報は必須であり、正しいクレジットカードの情報で無いときは決済できない' do
    end
    it '出品者はURLを直接入力して購入ページに遷移しようとすると、トップページに遷移すること' do
    end
    it '配送先の住所情報も購入の都度入力させる' do
    end
    it '購入が完了したら、トップページに遷移すること' do
    end
    it '購入した商品は、再度購入できない状態になっていること' do
    end
    it 'エラーハンドリングができていること（適切では無い値が入力された場合、情報は保存されず、エラーメッセージを出力させる）' do
    end
  end
end
