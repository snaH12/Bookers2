class BooksController < ApplicationController
  def new
    @book=Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      render:new
    end
  end
  
  def show
    @Book = Book.find(params[:id])
    @user = @Book.user
    @book = Book.new
  end

  def index
    @books = Book.all
    @user = current_user
    @book =Book.new
  end
  
  def edit
    @Book = Book.find(params[:id])
  end
  def update
    @Book = Book.find(params[:id])
    if@Book.update(book_params)
      flash[:notice]="You have updated book successfully"
      redirect_to book_path(@Book.id)
    else
      render:edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  private

  def book_params
    params.require(:book).permit(:image,:title,:body)
  end
end
