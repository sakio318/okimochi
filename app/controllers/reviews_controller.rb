class ReviewsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    review = Review.new(review_params)
    review.user_id = current_user.id
    review.item_id = item.id
    review.save
    redirect_to item_path(item)
  end

  def destroy
    Review.find_by(id: params[:id], item_id: params[:item_id]).destroy
    redirect_to item_path(params[:item_id])
  end

  private

  def review_params
    params.require(:review).permit(:rate)
  end
end
