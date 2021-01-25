class PostImage < ApplicationRecord
  belongs_to :item
  attachment :photo
end
