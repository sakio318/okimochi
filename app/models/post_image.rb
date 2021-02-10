class PostImage < ApplicationRecord
  belongs_to :item,inverse_of: :post_images
  attachment :photo
  validates :user_id ,presence:true
end
