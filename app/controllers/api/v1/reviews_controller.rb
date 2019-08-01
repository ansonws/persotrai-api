class Api::V1::ReviewsController < Api::ApplicationController
    before_action :authenticate_user!
    before_action :find_review, only: [:destroy]

    def create
        @trainer = Trainer.find(params[:trainer_id])
        @review = Review.new review_params
        @review.trainer = @trainer
        @review.user = current_user
        @review.save!
        render json: { status:201, id: @review.id }
    end

    def destroy
        @review.destroy!
        render json: { status: 200 }
    end

    private
    def review_params
        params.require(:review).permit(:body, :rating)
    end

    # def authorize
    #     redirect_to root_path, alert: 'Not Authorized' unless can?(:crud, @review)
    # end

    def find_review
        @review = Review.find(params[:id])
    end
end
