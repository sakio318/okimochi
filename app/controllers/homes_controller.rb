class HomesController < ApplicationController
  def top
    @favorite = Favorite.all
    @items = Item.all.order(comment_rate: :desc).limit(3)
    # @items = Item.find(@favorite.group(:item_id).order('count(item_id)desc').limit(3).pluck(:item_id))
  end
  
end
