class ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).reverse_order
    @user = User.find(current_user.id)
  end

  def show
    @item = Item.find_by(id: params[:id])
    @comment = Comment.new
    @comments = @item.comments.includes(:user).reverse_order
    @user = User.find(current_user.id)
    @situations = Situation.where(item_id: :@item)

  end

  def new
    @new_item = Item.new
    @genres = Genre.all
    @new_item.post_images.build
    @user = User.find(current_user.id)
  end

  def create
    @new_item = Item.new(item_params)
    @new_item.user_id = current_user.id
    @new_item.save
      item_params[:situation_ids].each do |sid|
        @item_situation = ItemSituation.new({
          situation_id: sid,
          item_id: @new_item.id
        })
        @item_situation.save
      end
    redirect_to user_path(current_user)
  end

  def edit
    @item = Item.find_by(id: params[:id])
    @user = User.find(current_user.id)
    @genres = Genre.all
  end

  def update
    @item = Item.find_by(id: params[:id])
    @item.update(item_params)
    redirect_to item_path(@item)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  def search
    situations = Situation.all
    @scene = params[:scene_ids]
    @scene.map!(&:to_i)
    item_all = Item.all
    @select_items =  Item.where(situations.ids == @scene)
    @user_or_item = params[:option]

    if @user_or_item == "1"
      @items = Item.search(params[:search],@user_or_item)

    end
    binding.pry
  end

  private
  def item_params
    params.require(:item).permit(:name,:shop_name,:url,:packing,
    :introduction,:genre_id, post_images_photos:[], situation_ids:[] )
  end
end
