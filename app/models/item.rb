class Item < ApplicationRecord
  belongs_to :genre
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :item_situations, dependent: :destroy
  has_many :situations, dependent: :destroy, through: :item_situations
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :item_situations, allow_destroy: true,
    reject_if: lambda {|attributes| attributes['situation_ids'].blank?}
end

