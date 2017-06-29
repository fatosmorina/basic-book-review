class BooksController < ApplicationController
	def index
	end

	def new
	  @book = Book.new	
	end

	def create
	  @book = Book.new(book_parameters)	

	  if @book.save
	  	redirect_to root_path
	  else
		render 'new'	
	  end
	end

	private

	def book_parameters
		params.require(:book).permit(:title, :description, :author)
	end

end
