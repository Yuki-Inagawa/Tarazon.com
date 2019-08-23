class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @products = Product.includes(:user).order("created_at DESC").limit(20)
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

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to root_path
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to root_path
  end

  def ranking
    @ranking = Product.find(Review.group(:product_id).order('count(product_id) desc').pluck(:product_id))
  end
private
  def product_params
    params.require(:product).permit(:title, :image, :description,:price).merge(user_id: current_user.id)
  end
end