class Item < ApplicationRecord
  belongs_to :genre
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :item_situations, dependent: :destroy
  has_many :situations, dependent: :destroy, through: :item_situations
  has_many :post_images, dependent: :destroy
  attr_accessor :situation_ids

  # バリデーション設定
  # シチュエーションバリデのみ下部に別途定義
  with_options presence: true do
    validates :name
    validates :shop_name
    validates :packing
    validates :introduction
  end
    validate :situation_valid?
    
    
# 検索アクション
# 検索ワードとシチュエーションが空で検索されることを想定した条件分岐
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

  private
  def situation_valid?
    if situation_ids.blank?
      errors.add(:situation_ids)
    end
  end

end