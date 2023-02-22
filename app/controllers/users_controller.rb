class UsersController < ApplicationController
   before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end
  
  def index
    @users=User.all
    @books= Book.all
    @book = Book.new
    @user =current_user
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
  
  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to users_path
    end
  end
end
