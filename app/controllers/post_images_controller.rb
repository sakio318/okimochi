class PostImagesController < ApplicationController
  belongs_to :item
  attachment :photo
end
