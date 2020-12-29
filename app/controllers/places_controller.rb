class PlacesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.build(place_params)
    if @place.save
      flash[:success] = "保存しました。"
      redirect_to places_path
    else
      flash.now[:danger] = "保存に失敗しました。"
      render :new
    end
  end

  def destroy
  end
  
  private
  
  def place_params
    params.require(:place).permit(:prefecture, :address, :spot, :detail, :rate)
  end
end
