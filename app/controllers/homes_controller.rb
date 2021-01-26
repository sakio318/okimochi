class HomesController < ApplicationController
  def top
    @favorite = Favorite.all
    @items = Item.find(@favorite.group(:item_id).order('count(item_id)desc').limit(3).pluck(:item_id))
  end
end
