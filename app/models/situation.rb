class Situation < ApplicationRecord
  has_many :item_situations
  has_many :items, through: :item_situations
end
