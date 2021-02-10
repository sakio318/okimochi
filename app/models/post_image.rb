class PostImage < ApplicationRecord
  belongs_to :item,inverse_of: :post_images
  attachment :photo
end
