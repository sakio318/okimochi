class HomesController < ApplicationController
  def top
    @favorite = Favorite.all
    @items = Item.joins(:comments).group("items.id").order("comments.rate DESC").limit(3)
  end
end
