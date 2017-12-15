class ReviewsController < ApplicationController
  def create
    @review = current_user.reviews.create(review_params)
    redirect_to @review.office
  end

  def destroy
    @review = Review.find(params[:id])
    office = @review.office
    @review.destroy
    redirect_to office
  end

  private

  def review_params
    params.require(:review).permit(:comment, :star, :office_id)
  end
end
