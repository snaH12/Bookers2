class BooksController < ApplicationController
  def new
    @book=Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = currrent_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      render:new
    end
  end

  def index
    @books=Book.all
  end

  def show
    @book=Book.find(params[:id])  
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  private

  def book_params
    params.require(:book).permit(:image, :title, :body)
  end
end
