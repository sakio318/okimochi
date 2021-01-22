class Situation < ApplicationRecord

  has_many :items, through: :item_situations
  has_many :item_situations
  accepts_nested_attributes_for :item_situations

end
