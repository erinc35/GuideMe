class ReviewsController < ApplicationController
  def new
    @guide = Guide.find(params[:guide_id])
    @review = Review.new
  end

  def create
    p "*" * 200
    p params[:guide_id]
    @guide = Guide.find(params[:guide_id])

    @review = @guide.reviews.new(rating: params[:rating], comment: params[:comment], traveler_id: session[:traveler_id])
    @review.save
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
