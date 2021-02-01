class Item < ApplicationRecord
  belongs_to :genre
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :item_situations, dependent: :destroy
  has_many :situations, dependent: :destroy, through: :item_situations
  has_many :post_images, dependent: :destroy

  def Item.search(search,user_or_item)
    if search.empty?
      @select_items
    elsif search.present?
      Item.where(['name LIKE?',"%#{search}%"]+(@select_items))
    else
      Item.all
    end
  end


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  accepts_nested_attributes_for :item_situations, allow_destroy: true
  accepts_attachments_for :post_images, attachment: :photo
end

