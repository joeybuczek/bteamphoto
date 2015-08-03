class ReviewsController < ApplicationController
  def create
  	# created on client landing page
  	# raise
  	@user = current_user
  	@review = @user.reviews.build(review_params).save
  	redirect_to request.referrer
  end

  def update
  	@review = Review.find(params[:id])
  	@review.update_attributes(review_params)
  	redirect_to request.referrer
  end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
  	redirect_to request.referrer
  end

  private

  def review_params
  	params.require(:review).permit(:genre, :body)
  end

end
