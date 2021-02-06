class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.find(current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @items = Item.where(user_id: @user.id).page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user),　notice: '編集されました'
    else
      render :edit
    end
  end

  def favo_index
    @user =  User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:item_id)
    @items = Item.find(favorites)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
