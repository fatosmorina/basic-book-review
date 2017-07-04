class ReviewsController < ApplicationController
	
	before_action :set_book, only: [:create, :update]
	before_action :set_review, only: [:edit, :update, :destroy]
	before_action :authenaticate_user!, only: [:new, :edit]
 
	def new
	  @review = Review.new	
	end

	def create
      @review = Review.new(review_parameters)
      
      @review.book_id = @book.id
      @review.user_id = current_user.id

      if @review.save
      	redirect_to book_path(@book)		
	  else
		render 'new'
	  end
	end

	def update
		@review = Review.find(params[:id])
		if @review.update(review_parameters)
			redirect_to book_path(@book)
		else
			render 'edit'
		end
	end

	def edit
	end


	private

	def review_parameters
	  params.require(:review).permit(:rating, :comment)		
	end

	def set_book
	  @book = Book.find(params[:book_id])	
	end

	def set_review
		@review = Review.find(params[:id])
	end
end
