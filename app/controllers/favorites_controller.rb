class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    place = Place.find(params[:place_id])
    current_user.like(place)
    flash[:success] = "お気に入りに追加しました。"
    redirect_to place_path(place)
  end

  def destroy
    place = Place.find(params[:place_id])
    current_user.unlike(place)
    flash[:success] = "お気に入りを解除しました。"
    redirect_to place_path(place)
  end
end
