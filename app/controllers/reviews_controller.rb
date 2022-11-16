class ReviewsController < ApplicationController
  # before_action will call set_restaurant before executing def new or def create
  before_action :set_restaurant, only: [:new, :create]

  def new
    # @restaurant = Restaurant.find(params[:restaurant_id]) - This line is implicit because of before_action
    @review = Review.new
  end

  def create
    # @restaurant = Restaurant.find(params[:restaurant_id]) - This line is implicit because of before_action
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
