class Api::ReviewsController < ApplicationController
  before_action :logged_in, only: [:create, :update, :destroy]

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
    if @review.save!
      render :index
    else
      render json: {message: @review.errors.full_messages}, status: 422
    end
  end

  def update
    @review = Review.find_by(id: params[:id])
    if @review.update(review_params)
      render :index
    else
      render json: {message: @review.errors.full_messages}, status: 422
  end

  def destroy
    @review = Review.find_by(id: params[:id])
    if @review
      @review.destroy
      render :index
    else
      render json: {message: @review.errors.full_messages}, status: 422
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating)
  end

end
