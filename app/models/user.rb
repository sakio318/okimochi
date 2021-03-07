class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  attachment :image

  validates :name ,presence: true, length: {minimum: 2,maximum: 15}
  validates :email,presence: true, length: {maximum: 255},uniqueness: true
  validates :introduction, length: {maximum: 50 }
  validates :encrypted_password,presence: true

# ゲストログイン機能
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
  end

end
