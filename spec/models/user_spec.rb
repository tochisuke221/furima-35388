require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザ新規登録' do
     before do
        @user=FactoryBot.build(:user)
     end
     #正常系
    context '新規登録できるとき' do
      it '正しく情報が入力されていれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれ  ば登録できる' do
        @user.password="aaa456"
        @user.password_confirmation="aaa456"
        expect(@user).to be_valid
      end
    end

     #異常系
    context '新規登録できないとき' do
      it 'nicknameが空であると登録できない' do
        @user.nickname=""
        @user.valid?
        expect(@user.errors.full_messages).to include ("Nickname can't be blank")
      end
      it 'c_last_nameが空であると登録できない' do
        @user.c_last_name=""
        @user.valid?
        expect(@user.errors.full_messages).to include ("C last name can't be blank")
      end
      it 'c_first_nameが空であると登録できない' do
        @user.c_first_name=""
        @user.valid?
        expect(@user.errors.full_messages).to include ("C first name can't be blank")
      end
      it 'j_last_nameが空であると登録できない' do
        @user.j_last_name=""
        @user.valid?
        expect(@user.errors.full_messages).to include ("J last name can't be blank")
      end
      it 'j_first_nameが空であると登録できない' do
        @user.j_first_name=""
        @user.valid?
        expect(@user.errors.full_messages).to include ("J first name can't be blank")
      end
      it 'birthdayが空であると登録できない' do
        @user.birthday=""
        @user.valid?
        expect(@user.errors.full_messages).to include ("Birthday can't be blank")
      end
      it 'emailが重複している' do
        another=FactoryBot.create(:user)
        @user.email=another.email
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email has already been taken")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '000aa'
        @user.password_confirmation = '000aa'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
        
      end
      it 'passwordとpassword_confirmationが一致してないと 登録できない' do
        @user.password="000000a"
        @user.password_confirmation="111111a"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
      end
      it 'passwordは全角では登録できないこと' do
        @user.password="全角パスワード"
        @user.password_confirmation=@user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordは数字のみでは登録できないこと' do
        @user.password= "123456"
        @user.password_confirmation=@user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordは英語のみでは登録できないこと' do
        @user.password="abcdef"
        @user.password_confirmation=@user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it '名前は漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.c_first_name="taro"
        @user.valid?
        expect(@user.errors.full_messages).to include("C first name is invalid")
      end
      it '名字は漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.c_last_name="tanaka"
        @user.valid?
        expect(@user.errors.full_messages).to include("C last name is invalid")
      end
      it '名前(カナ)は全角カタカナ以外では登録できないこと' do
        @user.j_first_name="taro"
        @user.valid?
        expect(@user.errors.full_messages).to include("J first name is invalid")
      end
      it '名字(カナ)は全角カタカナ以外では登録できないこと' do
        @user.j_first_name="tanaka"
        @user.valid?
        expect(@user.errors.full_messages).to include("J first name is invalid")
      end
      it 'emailは＠を含むこと' do
        @user.email="abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
    end
  end
end

