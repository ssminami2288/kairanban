class News < ApplicationRecord
  # 関連付けやバリデーション
  has_many_attached :pdfs
  has_many_attached :images

  validates :date, presence: true
end
