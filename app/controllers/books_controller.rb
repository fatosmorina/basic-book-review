class BooksController < ApplicationController

	def show
	end

	def index
	  @books = Book.all.order("created_at DESC")
	end

	def new
	  @book = Book.new	
	end

	def create
	  @book = Book.new(book_parameters)	
	  if @book.save
	  	redirect_to 'index'
	  else
		render 'new'	
	  end
	end

	private

	def book_parameters
		params.require(:book).permit(:title, :description, :author)
	end

end
