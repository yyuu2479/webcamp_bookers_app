class BooksController < ApplicationController
  def index
    @books = Book.all.order(id: :desc)
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    
    if book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(book.id)
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    
    if book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to books_path
    end
  end


  # プライベート
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
