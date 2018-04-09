class BooksController < ApplicationController
  def index
    # Our books' index view is expecting there to be a @books
    # This is a job for our controller's index action! Get your index working so that @books is correctly set to all books and we can see our library's index page.

    render :index Book.all

  end

  def new
    render :new
  end

  def create
    book = Book.new(book_params)
    render :new
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy

  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
