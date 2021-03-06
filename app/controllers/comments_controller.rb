class CommentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.item_id = @item.id
    unless @comment.save
      render 'error' and return
    else
       @comments = @item.comments.order(created_at: :desc)
       @comment = Comment.new
      render 'create' and return
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render "delete"
  end

  private

  def comment_params
    params.require(:comment).permit(:body,:rate,:user_id,:item_id)
  end
end
