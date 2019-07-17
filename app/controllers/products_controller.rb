class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @products = Product.includes(:user).order("created_at DESC")
  end

  def new
  end

  def create
    Product.create(
      title: product_params[:title],
      image: product_params[:image],
      description: product_params[:description],
      price: product_params[:price],
      user_id: current_user.id)
      redirect_to root_path
  end



private
  def product_params
    params.permit(:title, :image, :description,:price)
  end
end