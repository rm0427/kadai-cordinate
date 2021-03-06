class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :likes]
  def show
    @user = User.find(params[:id])
    @cordinates = current_user.cordinates.order(id: :desc)
    @likes = current_user.likes.order(id: :desc).page(params[:page]).per(6)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザーを登録しました'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました'
      render :new
    end
  end
  
  def likes
     @user = User.find(params[:id])
     @likes = @user.likes.order(id: :desc).page(params[:page]).per(6)
  end 

private

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end
end