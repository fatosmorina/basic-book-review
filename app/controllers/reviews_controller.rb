class ReviewsController < ApplicationController
	
	def new
	  @review = Review.new	
	end

	def create
		
	end


	private

	def review_parameters
	  params.require(:review).permit(:rating, :comment)		
	end
end