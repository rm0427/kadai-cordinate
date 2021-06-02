class ToppagesController < ApplicationController
  def index
    if logged_in?
      @cordinates = Cordinate.order(id: :desc).limit(6)
      @likes = current_user.likes.order(id: :desc).page(params[:page]).per(6)
    end
  end

end
