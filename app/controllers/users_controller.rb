class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end
  
  def index
    @books=Book.all
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice]="You have updated user successfully"
    redirect_to user_path(@user.id)
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end
end