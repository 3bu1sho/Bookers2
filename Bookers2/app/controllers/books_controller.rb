class BooksController < ApplicationController
  before_action :authenticate_user!
    
  def new
  @book = Book.new

  end

  def create
    @book = Book.new(book_params) 
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      @books = Book.all
      render "index"    end
  end

  def index
        @books = Book.all
        @book = Book.new
        @user = current_user

  end

  def show
        @user = current_user
        @book = Book.find(params[:id])
        @book_new = Book.new
  end

  def destroy
  end
  
  def edit
        @user = current_user
        @book = Book.find(params[:id])
  end
  
  def update
        @book = Book.find(params[:id])
        @book.update(book_params)
        redirect_to book_path(@book.id)
  end
  
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end