class UsersController < ApplicationController

  before_action :authenticate_user!



  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:user] = "User was successfully updated."
      redirect_to user_path(current_user.id)
    else
      render 'edit'
    end
  end

  def index
    @users = User.all
    @user = User.find(current_user.id)
    @book = Book.new
  end


  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
