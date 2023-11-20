# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  context '正常系' do
    it '適切な情報が与えられた場合、ユーザーが作成されること' do
      user = User.new(
        email: 'test@example.com',  # これを追加
        name: 'test',
        password: 'Password1',
        password_confirmation: 'Password1',
        first_name: 'ジョン',
        last_name: 'ドウ',
        first_kananame: 'ジョン',
        last_kananame: 'ドウ',
        birthday: '1990-01-01'
      )
      expect(user).to be_valid
    end
  end

  context '異常系' do
    before do
      @user = User.new(
        name: 'test',
        password: 'Password1',
        password_confirmation: 'Password1',
        first_name: 'ジョン',
        last_name: 'ドウ',
        first_kananame: 'ジョン',
        last_kananame: 'ドウ',
        birthday: '1990-01-01'
      )
    end

    it 'ユーザー名がない場合、ユーザーが作成されないこと' do
      @user.name = nil
      expect(@user).not_to be_valid
    end

    it 'パスワードが要件を満たさない場合、ユーザーが作成されないこと' do
      @user.password = 'invalidpassword'
      expect(@user).not_to be_valid
    end

    it '名前が要件を満たさない場合、ユーザーが作成されないこと' do
      @user.first_name = 'Invalid123'
      expect(@user).not_to be_valid
    end

    it 'カナ名が要件を満たさない場合、ユーザーが作成されないこと' do
      @user.first_kananame = 'Invalid123'
      expect(@user).not_to be_valid
    end

    it '生年月日がない場合、ユーザーが作成されないこと' do
      @user.birthday = nil
      expect(@user).not_to be_valid
    end
  end
end
