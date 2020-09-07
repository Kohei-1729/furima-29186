require 'rails_helper'

RSpec.describe User, type: :model do
  describe '会員情報入力の登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
    end
    it 'nicknameが空では登録できない' do
    end
    it 'emailが空では登録できない' do
    end
    it '重複したemailが存在する場合登録できない' do
    end
    it 'emailに＠がないと登録できない' do
    end
    it 'passwordが空では登録できない' do
    end
    it 'passwordが5文字以下であれば登録できない' do
    end
    it 'passwordは半角英数字混合でないと登録できない' do
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
    end
    it '新規登録・ログイン共に適切ではない値が存在する場合はエラーメッセージが出力される' do
    end
    it 'last_nameとfirst_nameのどちらかでも空だと登録出来ない' do
    end
    it 'last_nameとfirst_nameは全角でないと登録できない' do
    end
    it 'last_name_kanaとfirst_name_kanaのどちらかでも空だと登録出来ない' do
    end
    it 'last_name_kanaとfirst_name_kanaは全角カナでないと登録できない' do
    end
    it 'birth_dateが空では登録できない' do
    end
  end
end
