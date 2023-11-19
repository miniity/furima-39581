require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録' do
    let(:valid_attributes) do
      {
        name: 'test',
        email: 'test@example.com',
        password: 'Password1',
        password_confirmation: 'Password1',
        first_name: 'ジョン',
        last_name: 'ドウ',
        first_kananame: 'ジョン',
        last_kananame: 'ドウ',
        birthday: '1990-01-01'
      }
    end

    it '必須項目が欠けている場合は登録できない' do
      user = User.new(valid_attributes.except(:name))
      user.valid?
      expect(user.errors.full_messages).to include("Name can't be blank")
    end

    it 'メールアドレスが無効な場合は登録できない' do
      user = User.new(valid_attributes.merge(email: 'invalid_email'))
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end

    it 'パスワードが6文字未満の場合は登録できない' do
      user = User.new(valid_attributes.merge(password: '12345', password_confirmation: '12345'))
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'パスワードが半角英数字混合でない場合は登録できない' do
      user = User.new(valid_attributes.merge(password: 'invalidpassword', password_confirmation: 'invalidpassword'))
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end

    it 'パスワードとパスワード（確認）が一致しない場合は登録できない' do
      user = User.new(valid_attributes.merge(password_confirmation: 'different_password'))
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '名前が無効な場合は登録できない' do
      user = User.new(valid_attributes.merge(last_name: 'Smith', first_name: 'John'))
      user.valid?
      expect(user.errors.full_messages).to include("Last name is invalid", "First name is invalid")
    end

    it 'カナ名が無効な場合は登録できない' do
      user = User.new(valid_attributes.merge(last_kananame: 'Smith', first_kananame: 'John'))
      user.valid?
      expect(user.errors.full_messages).to include("Last kananame is invalid", "First kananame is invalid")
    end

    it '生年月日が無効な場合は登録できない' do
      user = User.new(valid_attributes.merge(birthday: 'invalid_date'))
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end

