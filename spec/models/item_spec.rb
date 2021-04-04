require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品の出品' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品が正常にできる時' do
      it '正しく情報を全て入力している時' do
        expect(@item).to be_valid
      end

      it '価格は半角数字であれば登録できる' do
        @item.price = '2500'
        expect(@item).to be_valid
      end
    end

    context '出品ができない時' do
      it '画像が空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.image.attached?).to eq false
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空だと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが空（1が選択されている）だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品の状態が空（1が選択されている）だと出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it '配送料の負担についてが空（1が選択されている）だと出品できない' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee must be other than 1')
      end
      it '発送元の地域についてが空（1が選択されている）だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '発送までの日数についてが空（1が選択されている）だと出品できない' do
        @item.term_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Term must be other than 1')
      end
      it '価格が空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が299円以下であると出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が10,000,000円以下であると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '価格は半角数字以外では出品できない' do
        @item.price = '１２００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '出品者が紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '価格は半角英数混合では登録できないこと' do
        @item.price = '123dfg'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格は半角英語だけでは登録できないこと' do
        @item.price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
