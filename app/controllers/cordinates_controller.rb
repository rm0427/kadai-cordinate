class CordinatesController < ApplicationController
  before_action :require_user_logged_in
  
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
      redirect_to root_url
    else
      @cordinates = Cordinate.order(id: :desc).page(params[:page]).per(6)
      render 'toppages/index'
    end
  end

  def show
    @cordinate = Cordinate.find(params[:id]) 
  end

private

  def cordinate_params
    params.require(:cordinate).permit(:title, :tops, :bottoms, :shoes, :bag, :image)
  end

end