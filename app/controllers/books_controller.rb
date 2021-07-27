class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to books_path
  end

  def show
  end

  def edit
  end

  # プライベート
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
