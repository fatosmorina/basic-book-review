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

	def get_book
	  @book = Book.find(params[:book_id])	
	end
end
