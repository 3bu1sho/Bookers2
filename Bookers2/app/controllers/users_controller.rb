class UsersController < ApplicationController
  before_action :authenticate_user! 
  before_action :correct_user,   only: [:edit, :update]
  
  
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
    @user = current_user
  end
  
  def update
    @user = current_user
    @user.save
    if @user.update(user_params)
       flash[:notice] = "form,successfully"
       redirect_to user_path(@user.id)
    else
      @user = current_user
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
    def correct_user
      @user = User.find(params[:id])
      redirect_to user_path(current_user) unless @user == current_user
    end
end
