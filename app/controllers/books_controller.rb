class BooksController < ApplicationController

	before_action :find_book, only: [:show, :edit, :update, :destroy]
	before_action :set_categories, only: [:edit, :new]

	def show
	end

	def index
	  @books = Book.all.order("created_at DESC")
	end

	def new
	  @book = current_user.books.build
	end

	def create
	  @book = current_user.books.build(book_parameters)	
	  @book.category_id = params[:category_id]
	  if @book.save
	  	redirect_to root_path
	  else
		render 'new'	
	  end
	end

	def edit
	end

	def update 
	  if @book.update(book_parameters)
   	  	redirect_to book_path(@book)
   	  else
   	  	render 'edit'
	  end
	end

	def destroy
	  @book.destroy
	  redirect_to root_path
	end

	private

	def book_parameters
		params.require(:book).permit(:title, :description, :author, :category_id)
	end

	def find_book
		@book = Book.find(params[:id])
	end

	def set_categories
		@categories = Category.all.map{ |categories| [categories.name, categories.id] }
	end

end
