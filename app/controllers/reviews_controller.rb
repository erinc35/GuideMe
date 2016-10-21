class ReviewsController < ApplicationController
  def new
    @guide = Guide.find(params[:guide_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save

    else
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end
end
