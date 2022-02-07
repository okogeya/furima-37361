require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation,family_name,first_name,kana_family_name,kana_first_name,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください', 'パスワードには英字と数字の両方を含めて設定してください',
                                                      'パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（姓）を入力してください', 'お名前（姓）には全角（漢字・ひらがな・カタカナ）を使用してください')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（名）を入力してください', 'お名前（名）には全角（漢字・ひらがな・カタカナ）を使用してください')
      end
      it 'kana_family_nameが空では登録できない' do
        @user.kana_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ（姓）を入力してください', 'お名前カナ（姓）には全角（カタカナ）を使用してください')
      end
      it 'kana_first_nameが空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ（名）を入力してください', 'お名前カナ（名）には全角（カタカナ）を使用してください')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('生年月日を入力してください')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailが@を含まなければ登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください', 'パスワードには英字と数字の両方を含めて設定してください')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end
      it 'passwordが全角文字を含んでいては登録できない' do
        @user.password = 'テスト123'
        @user.password_confirmation = 'テスト123'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end
      it 'Family_nameは全角でなければ登録できない' do
        @user.family_name = '1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（姓）には全角（漢字・ひらがな・カタカナ）を使用してください')
      end
      it 'First_nameは全角でなければ登録できない' do
        @user.first_name = '1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（名）には全角（漢字・ひらがな・カタカナ）を使用してください')
      end
      it 'Kana_family_nameは全角カタカナでなければ登録できない' do
        @user.kana_family_name = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ（姓）には全角（カタカナ）を使用してください')
      end
      it 'Kana_first_nameは全角カタカナでなければ登録できない' do
        @user.kana_first_name = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ（名）には全角（カタカナ）を使用してください')
      end
    end
  end
end
