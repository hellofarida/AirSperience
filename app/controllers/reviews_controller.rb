class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @review.user_id = current_user.id
    @experience = Experience.find(params[:experience_id])
    @review.experience = @experience
  end

  def create
    @review = Review.new(review_params)
    @experience = Experience.find(params[:experience_id])

    @review.user_id = current_user.id
    @review.experience = @experience

    if @review.save
      redirect_to experience_path(params[:experience_id])
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
