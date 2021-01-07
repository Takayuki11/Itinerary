class PlacesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @places = Place.all.order(id: "DESC").page(params[:page]).per(10)
  end
  
  def show
    @place = Place.find(params[:id])
  end 
  
  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.build(place_params)
    if @place.save
      flash[:success] = "投稿を保存しました。"
      redirect_to places_path
    else
      flash.now[:danger] = "投稿を保存に失敗しました。"
      render :new
    end
  end

  def destroy
    @user = current_user
    @place = Place.find(params[:id])
    @place.destroy
    flash[:success] = "投稿を削除しました。"
    redirect_to @user
  end
  
  private
  
  def place_params
    params.require(:place).permit(:prefecture, :address, :spot, :detail, :rate)
  end
end
