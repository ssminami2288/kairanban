require 'rails_helper'

RSpec.describe Meeting, type: :model do
  describe '理事会の日付設定' do
    it '日付が空では登録できない' do
      meeting = Meeting.new(date: nil)
      expect(meeting).not_to be_valid
      expect(meeting.errors[:date]).to include("can't be blank")
    end

    it '有効な日付で登録できる' do
      meeting = Meeting.new(date: Date.today)
      expect(meeting).to be_valid
    end

    it '過去の日付で登録できない' do
      meeting = Meeting.new(date: Date.yesterday)
      expect(meeting).not_to be_valid
      expect(meeting.errors[:date]).to include("can't be in the past")
    end
  end
end
