class Post < ApplicationRecord
  enum category: { post: '回覧板' }
  has_many_attached :pdf
  has_many_attached :image
  has_many :stamps, dependent: :destroy
end
