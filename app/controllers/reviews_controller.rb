class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @spot = Spot.find(params[:spot_id])
    @reviews = @spot.reviews
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to spot_reviews_path(@review.spot)
    else
      flash[:alert] = "レビューの投稿に失敗しました"
      @spot = Spot.find(params[:spot_id])
      render "spots/show"
    end
  end

  private
  def review_params
    params.require(:review).permit(:spot_id, :score, :content)
  end
end
