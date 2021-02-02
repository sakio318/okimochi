class Item < ApplicationRecord
  belongs_to :genre
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :item_situations, dependent: :destroy
  has_many :situations, dependent: :destroy, through: :item_situations
  has_many :post_images, dependent: :destroy

  def Item.search_for(search,scene)
    if search.nil?
      Item.joins(:situations).where("situations.id IN (?)", scene).distinct
    elsif scene.nil?
      Item.joins(:situations).where("items.name LIKE(?) ", "%#{search}%" ).distinct

    elsif [search,scene].present?
      Item.joins(:situations).where("items.name LIKE (?) AND situations.id IN (?)", "%#{search}%", scene).distinct
    else
      @items = Item.all
    end
  end


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  accepts_nested_attributes_for :item_situations, allow_destroy: true
  accepts_attachments_for :post_images, attachment: :photo
end

