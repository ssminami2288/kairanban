class Post < ApplicationRecord
  enum category: { post: '回覧板' }
  has_many_attached :pdfs
  has_many_attached :images
  has_many :stamps, dependent: :destroy
end
