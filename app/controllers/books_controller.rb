class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    book = Book.new(book_params)
    book.save
    redirect_to '/index'
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def uddate
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to show_book(book.id)  
  end

 private
 def book_params
    params.require(:book).permit(:title, :body)
 end
end
