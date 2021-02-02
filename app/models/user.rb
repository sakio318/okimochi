class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  attachment :image

  def User.search(search,user_or_item)
      if user_or_item == "1"
        User.where(['name LIKE ?',"%#{search}%"])
      else
        User.all
      end
  end
end
