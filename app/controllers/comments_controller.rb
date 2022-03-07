class CommentsController < ApplicationController
  before_action :find_product

  def new
  end

  def create
  	@comment = Comment.create(comment_params)
    #binding.pry
  end

  def edit
    @comment = Comment.find(params[:id])
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
  	@comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
  	params.permit(:body, :user_id, :product_id)
  end

  def find_product
  	@product = Product.find(params[:product_id])
  end
end
