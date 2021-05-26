class ReviewsController < ApplicationController
    def new
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = Review.new
    end

    def create
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = Review.create(review_params)
        @review.restaurant = @restaurant
        if @review.save
            redirect_to @restaurant
        else
            render :new # this refers to new.html.erb
        end
    end

    def review_params
        params.require(:review).permit(:content, :rating)
    end
end
