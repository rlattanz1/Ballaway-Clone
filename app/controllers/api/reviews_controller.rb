class Api::ReviewsController < ApplicationController
  # before_action :require_logged_in, only: [:create, :update, :destroy]

  def index
    @reviews = Review.all
    render :index
  end

  def show
    @review = Review.find_by(id: params[:id])
    if @review
      render :show
    else
      render json: {message: @review.errors.full_messages}, status: 422
    end
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      render :show
    else
      render json: {message: @review.errors.full_messages}, status: 422
    end
  end

  def update
    @review = Review.find_by(id: params[:id])
    if @review.update(review_params) && @review.user_id == current_user.id
      render :show
    else
      render json: {message: @review.errors.full_messages}, status: 422
    end
  end

  def destroy
    @review = Review.find_by(id: params[:id])
    if @review && @review.user_id == current_user.id
      @review.destroy
    else
      render json: {message: ['not a valid review']}, status: 422
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating, :user_id, :product_id, :value, :quality, :durability, :recommendation)
  end

end
