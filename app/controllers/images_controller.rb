class ImagesController < ApplicationController
  belongs_to :item
  attachment :image
end
