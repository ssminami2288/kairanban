class Stamp < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :post_id, uniqueness: { scope: :user_id, message: 'は既にスタンプを押しています' }
end
