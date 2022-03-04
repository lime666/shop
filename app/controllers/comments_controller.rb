class CommentsController < ApplicationController
  before_action :find_product

  def new
  end

  def create
  	@comment = @product.comments.create(comment_params)
  end

  def edit
    @comment = @product.comments.find(params[:id])
  end

  def update
  	@comment = Comment.find(params[:id])
    @comment.update(comment_params)

    if @comment.update(comment_params)
      redirect_to product_path(@product), notice: 'Comment was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
  	@comment = @product.comments.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
  	params.require(:comment).permit(:body, :user_id, :product_id)
  end

  def find_product
  	@product = Product.find(params[:product_id])
  end
end
