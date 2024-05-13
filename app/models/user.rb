class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :password, presence: true, format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9]).+\z/ }
  validates :room_number, presence: true, format: { with: /\A\d{3,4}\z/, message: 'is invalid' }
  validates :email, presence: true

  def admin?
    admin
  end
  has_many :stamps
end
