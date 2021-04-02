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
    it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      @user.password="123456"
      @user.password_confirmation="123456"
      expect(@user).to be_valid
    end
  end

   #異常系
  context '新規登録できないとき' do
    it 'nicknameが空であると登録できない' do
      @user.nickname=""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'c_last_nameが空であると登録できない' do
      @user.c_last_name=""
      @user.valid?
      expect(@user.errors.full_messages).to include("C last name can't be blank")
    end
    it 'c_first_nameが空であると登録できない' do
      @user.c_first_name=""
      @user.valid?
      expect(@user.errors.full_messages).to include("C first name can't be blank")
    end
    it 'j_last_nameが空であると登録できない' do
      @user.j_last_name=""
      @user.valid?
      expect(@user.errors.full_messages).to include("J last name can't be blank")
    end
    it 'j_first_nameが空であると登録できない' do
      @user.j_first_name=""
      @user.valid?
      expect(@user.errors.full_messages).to include("J first name can't be blank")
    end
    it 'birthdayが空であると登録できない' do
      @user.birthday=""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it 'emailが重複している' do
      another=FactoryBot.create(:user)
      @user.email=another.email
      @user.valid?
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordとpassword_confirmationが一致してないと登録できない' do
      @user.password="000000"
      @user.password_confirmation="111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
