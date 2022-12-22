class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]


  def index
    @book = Book.new
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @Books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

   def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       redirect_to book_path(@book.id)
    else
       @book = Book.all
       render :index
    end
   end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "successfully"
       redirect_to user_path(@user.id)
    else
       render :edit
    end
  end

   private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
     user = User.find(params[:id])
     if user != current_user
       redirect_to user_path(current_user)
     end
  end
end
