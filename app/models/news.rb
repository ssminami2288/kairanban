class News < ApplicationRecord
  # 関連付けやバリデーション
  has_many_attached :pdfs

  validates :date, presence: true
end
