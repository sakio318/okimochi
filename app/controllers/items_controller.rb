class ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).reverse_order
  end

  def show
  end

  def new
    @new_item = Item.new
    @genres = Genre.all
    @new_item.images.new

  end

  def create
    @new_item = Item.new(item_params)
    @new_item.user_id = current_user.id
    @new_item.save
      item_params.situation_ids.each do |sid|
        @item_situation = ItemSituation.new({
          situation_id: sid,
          item_id: @new_item.id
        })
        @item_situation.save
      end
    # binding.pry
    redirect_to user_path(current_user)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:name,:shop_name,:url,:packing,
    :introduction,:genre_id, { situation_ids:[] }, images_attributes:[:image])
  end
end
