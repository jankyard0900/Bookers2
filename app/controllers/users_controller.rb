class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]


  def index
    @users = User.all
    @booka = Book.new
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books  #左を右に代入
    @booka = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
     if @user.update(user_params)
      flash[:success] = "You have updated user successfully."
      redirect_to user_path(@user.id)
     else
       render :edit
     end
  end

  def follows
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
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
