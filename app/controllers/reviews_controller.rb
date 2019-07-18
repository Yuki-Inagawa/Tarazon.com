class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    @product = Product.find(params[:product_id])
    review = Review.new(create_params)
    # Review.create(create_params)
    # トップページにリダイレクトする
    review.save
    redirect_to controller: :products, action: :index
  end

  private
  def create_params
    params.require(:review).permit(:rate, :review).merge(product_id: params[:product_id])
  end
end
