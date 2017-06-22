# ReviewsController
class ReviewsController < ApplicationController
  def create
    @user = current_user
    @review = @user.reviews.build(reviews_params)
    @review.save

    redirect_back(fallback_location: :back)
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html do
        redirect_to reviews_url, notice: 'Review was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  def reviews_params
    params.require(:review).permit(:rating, :planification_id)
  end
end
