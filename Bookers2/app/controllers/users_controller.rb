class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new

  end
  
  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
    @users = User.all



  end
  
  def edit
        @user = User.find(params[:id])
            @book = Book.new


  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)  
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
