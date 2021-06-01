class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    cordinate = Cordinate.find(params[:cordinate_id])
    current_user.like(cordinate)
    flash[:success] = 'コーディネートをお気に入りしました'
    redirect_to root_url
  end

  def destroy
    cordinate = Cordinate.find(params[:cordinate_id])
    current_user.unlike(cordinate)
    flash[:success] = 'お気に入りを解除しました'
    redirect_to root_url
  end
end
