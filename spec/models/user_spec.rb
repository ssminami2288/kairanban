require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it '姓が空では登録できない' do
      user = User.new(last_name: '', first_name: '太郎', room_number: '1234', email: 'test@example.com', password: 'password')
      expect(user).not_to be_valid
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it '名が空では登録できない' do
      user = User.new(last_name: '山田', first_name: '', room_number: '1234', email: 'test@example.com', password: 'password')
      expect(user).not_to be_valid
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it '部屋番号が空では登録できない' do
      user = User.new(last_name: '山田', first_name: '太郎', room_number: '', email: 'test@example.com', password: 'password')
      expect(user).not_to be_valid
      expect(user.errors[:room_number]).to include("can't be blank")
    end

    it 'メールアドレスが空では登録できない' do
      user = User.new(last_name: '山田', first_name: '太郎', room_number: '1234', email: '', password: 'password')
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'パスワードが空では登録できない' do
      user = User.new(last_name: '山田', first_name: '太郎', room_number: '1234', email: 'test@example.com', password: '')
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include("can't be blank")
    end
  end
end
