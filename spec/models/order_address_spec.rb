require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入者情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと保存できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('クレジットカード情報を入力してください')
      end
      it 'post_codeが空だと保存できないこと' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号を入力してください', '郵便番号はハイフンを含めた半角数値で入力してください')
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号はハイフンを含めた半角数値で入力してください')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_address.prefecture = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('都道府県を選択してください')
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('市区町村を入力してください')
      end
      it 'house_numberが空だと保存できないこと' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('番地を入力してください')
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号を入力してください', '電話番号は10桁以上11桁以内の半角数値で入力してください（ハイフンなし）')
      end
      it 'phone_numberが半角数値のみでないと保存できないこと' do
        @order_address.phone_number = '０１１１１１１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は10桁以上11桁以内の半角数値で入力してください（ハイフンなし）')
      end
      it 'phone_numberにハイフンが含まれると保存できないこと' do
        @order_address.phone_number = '0111-111-111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は10桁以上11桁以内の半角数値で入力してください（ハイフンなし）')
      end
      it 'phone_numberが半角9桁以下の数値では保存できないこと' do
        @order_address.phone_number = '012345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は10桁以上11桁以内の半角数値で入力してください（ハイフンなし）')
      end
      it 'phone_numberが半角12桁以上の数値では保存できないこと' do
        @order_address.phone_number = '012345678900'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は10桁以上11桁以内の半角数値で入力してください（ハイフンなし）')
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Userが存在しません')
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Itemが存在しません')
      end
    end
  end
end
