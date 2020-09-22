require 'rails_helper'

RSpec.describe User, type: :model do
  describe '会員情報入力の登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user).to be_valid
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end
    it 'emailに＠がないと登録できない' do
      @user.email = 'ttooooo'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールが正しくありません')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it 'passwordが5文字以下であれば登録できない' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it 'last_nameが空だと登録出来ない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名字を入力してください")
    end
    it 'first_nameが空だと登録出来ない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前を入力してください")
    end
    it 'last_nameは全角でないと登録できない' do
      @user.last_name = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('名字を全角で入力してください')
    end
    it 'first_nameは全角でないと登録できない' do
      @user.first_name = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前を全角で入力してください')
    end
    it 'last_name_kanaが空だと登録出来ない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名字（カナ）を入力してください")
    end
    it 'first_name_kanaが空だと登録出来ない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前（カナ）を入力してください")
    end
    it 'last_name_kanaは全角カナでないと登録できない' do
      @user.last_name_kana = '可可'
      @user.valid?
      expect(@user.errors.full_messages).to include('名字（カナ）を全角カナで入力してください')
    end
    it 'first_name_kanaは全角カナでないと登録できない' do
      @user.first_name_kana = '可可'
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前（カナ）を全角カナで入力してください')
    end
    it 'birth_dateが空では登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
    end
  end
end
