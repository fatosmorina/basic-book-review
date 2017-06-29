class BooksController < ApplicationController

	before_action :find_book, only: [:show, :edit, :update, :destroy]

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

	def find_book
		@book = Book.find(params[:id])
	end

end
