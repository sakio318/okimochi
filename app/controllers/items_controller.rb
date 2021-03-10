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
  end

  def new
    @new_item = Item.new
    @genres = Genre.all
    @new_item.post_images.build
    @user = User.find(current_user.id)
  end

  def create
    @genres = Genre.all
    @user = User.find(current_user.id)
    @new_item = Item.new(item_params)
    @new_item.user_id = current_user.id
    # シチュエーションの複数保存
    if @new_item.save
      item_params[:situation_ids].each do |sid|
        @item_situation = ItemSituation.new({
          situation_id: sid,
          item_id: @new_item.id
        })
        @item_situation.save
      end
      redirect_to item_path(@new_item),notice: '投稿されました'
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    @user = User.find(current_user.id)
    @genres = Genre.all
    @item.situation_ids = @item.item_situations.pluck(:situation_id)
  end

  def update
    @genres = Genre.all
    @user = User.find(current_user.id)
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item),　notice: '編集が完了しました'
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path,notice: '削除されました'
  end

  # 検索アクション
  def search
    @scene = params[:scene_ids]
    # シーンを選択していたらint型に変換
    if @scene.present?
      @scene.map!(&:to_i)
    elsif @scene.blank?
      @scene = nil
    end

    @search = params[:search]
    if @search.blank?
      @search = nil
    end
     @user_or_item = params[:option]

    if @user_or_item == "おきもち"
      @items = Item.search_for(@search,@scene)
      @user = User.find(current_user.id)
    end
  end

  private
  def item_params
    params.require(:item).permit(:name,:shop_name,:packing,
    :introduction,:genre_id, post_images_photos:[], situation_ids:[] )
  end
end
