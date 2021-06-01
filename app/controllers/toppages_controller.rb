class ToppagesController < ApplicationController
  def index
    if logged_in?
      @cordinates = Cordinate.order(id: :desc).limit(6)
    end
  end
end
