require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it '全ての属性が空では登録できない' do
      user = User.new(
        name: '',
        email: '',
        password: '000000',
        password_confirmation: '000000',
        first_name: '',
        last_name: '',
        first_kananame: '',
        last_kananame: '',
        birthday: ''
      )

      user.valid?

      expect(user.errors.full_messages).to include(
        "Name can't be blank",
        "Email can't be blank",
        "First name can't be blank",
        "Last name can't be blank",
        "First kananame can't be blank",
        "Last kananame can't be blank",
        "Birthday can't be blank"
      )
    end
  end
end
