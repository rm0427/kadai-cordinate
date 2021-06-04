class CordinatesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def index
    @cordinates = Cordinate.order(id: :desc).page(params[:page]).per(6)
  end

  def new
    @cordinate = Cordinate.new
  end

  def create
    @cordinate = current_user.cordinates.build(cordinate_params)

    if @cordinate.save
      flash[:success] = 'コーディネートを投稿しました！'
      redirect_to cordinates_url
    else
      @cordinates = Cordinate.order(id: :desc).page(params[:page]).per(6)
      @likes = current_user.likes.order(id: :desc).page(params[:page]).per(6)
      render 'toppages/index'
    end
  end

  def show
    @cordinate = Cordinate.find(params[:id]) 
  end
  
  def destroy
    @cordinate.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_to cordinates_url(fallback_location: root_path)
  end

private

  def cordinate_params
    params.require(:cordinate).permit(:title, :tops, :bottoms, :shoes, :bag, :image)
  end
  
  def correct_user
    @cordinate = current_user.cordinates.find_by(id: params[:id])
    unless @cordinate
      redirect_to cordinates_url
    end
  end
end