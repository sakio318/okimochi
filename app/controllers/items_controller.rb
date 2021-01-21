class ItemsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @new_item = Item.new
    
  end

  def create
    @new_item = Item.new(item_params)
    @new_item.save
    redirect to 
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:name,:shop_name,:url,:packing,:introduction,:genre_id)
  end
end
