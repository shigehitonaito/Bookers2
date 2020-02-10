class BooksController < ApplicationController
 before_action :authenticate_user!, only: [:index, :new, :show, :create, :edit, :update, :destroy]



  def index
    @books = Book.all
    @user = User.find(current_user.id)
    @book = Book.new
  end

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @boo = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:book] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = User.find(current_user.id)
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:book] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
    render 'edit'
  end
  end

  def destroy
    book = Book.find(params[:id])
    book.delete
    redirect_to books_path
  end

  def about
  end

  def home

  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
