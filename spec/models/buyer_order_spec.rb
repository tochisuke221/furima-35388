require 'rails_helper'

RSpec.describe BuyerOrder, type: :model do
  describe '商品の購入に関して' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @buyer_order = FactoryBot.build(:buyer_order, user_id: user.id, item_id: item.id)
      sleep 0.05 # ここで止めないとMySQLのエラーが出る　itemの処理が重い可能性がある
    end

    context '内容に問題ない場合' do
      it '正しい情報があれば保存ができること' do
        expect(@buyer_order).to be_valid
      end
      it '郵便番号のフォーマットが正しければ保存ができる' do
        @buyer_order.address_line = '123-4567'
        expect(@buyer_order).to be_valid
      end
      it '電話番号の桁数が正しければ保存できる' do
        @buyer_order.phone_num = '09012341234'
        expect(@buyer_order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空では保存ができないこと' do
        @buyer_order.address_code = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Address code can't be blank")
      end

      it 'tokenが空では登録できないこと' do
        @buyer_order.token = nil
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Token can't be blank")
      end

      it '都道府県が空では保存できない' do
        @buyer_order.prefecture_id = 1
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it '市町村が空では保存できない' do
        @buyer_order.city = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では保存できない' do
        @buyer_order.address_line = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Address line can't be blank")
      end
      it '電話番号が数字でないと保存できない' do
        @buyer_order.phone_num = 'abcdefg'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include('Phone num is invalid')
      end

      it '郵便番号のフォーマットが異なると保存できない' do
        @buyer_order.address_code = '1234567'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include('Address code is invalid')
      end
      it '郵便番号に数値以外が入力されると保存できない' do
        @buyer_order.address_code = '12sadfd'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include('Address code is invalid')
      end

      it '購入者が紐づいていないと保存できない' do
        @buyer_order.user_id = nil
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("User can't be blank")
      end
      it '商品が紐づいていないと保存できない' do
        @buyer_order.item_id = nil
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Item can't be blank")
      end
      it '電話番号が12桁以上の場合は保存できない' do
        @buyer_order.phone_num ="1234567891011"
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Phone num is invalid")
      end
    end
  end
end
