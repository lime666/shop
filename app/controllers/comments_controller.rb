class CommentsController < ApplicationController
  before_action :set_product, only: %i[show]
  before_action :set_comment, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
	  @comment = Comment.create(comment_params)
    #binding.pry
  end

  def show
    @comments = @product.comments.find(params[:id])
  end

  def edit
  end

  def update
    #@product = @comment.product
    @comment.update(comment_params)
  end

  def destroy
    @product = @comment.product
    @comment.destroy
  end


  private

  def comment_params
  	params.permit(:body, :user_id, :product_id, :rating)
  end 

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
