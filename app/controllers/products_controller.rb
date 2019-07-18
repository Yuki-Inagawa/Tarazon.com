class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @products = Product.includes(:user).order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
      redirect_to root_path
  end

  def show
    @product = Product.find(params[:id])
    # @comments = @tweet.comments.includes(:user)
  end


private
  def product_params
    params.require(:product).permit(:title, :image, :description,:price).merge(user_id: current_user.id)
  end
end