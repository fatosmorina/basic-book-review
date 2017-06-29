class BooksController < ApplicationController
	def index
	end

	def new
	  @book = Book.new	
	end

	def create
	  @book = Book.new(book_parameters)	
	end

	private

	def book_parameters
		params.require(:book).permit(:title, :description, :author)
	end

end
