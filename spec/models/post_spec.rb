require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '投稿が無効' do
    it '日付がない場合、無効であること' do
      post = build(:post, date: nil)
      post.valid?
      expect(post.errors[:date]).to include('を入力してください')
    end

    it 'タイトルがない場合、無効であること' do
      post = build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include('を入力してください')
    end
  end

  describe '投稿が成功' do
    it '複数のPDFが添付されていることができる' do
      post = create(:post_with_pdfs)
      expect(post.pdfs.count).to eq(3)
    end
  end
end
