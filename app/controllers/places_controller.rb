class PlacesController < ApplicationController
  before_action :require_user_logged_in, only:[:index, :new, :create, :destroy]
  before_action :correct_user, only:[:destroy]
  
  def index
    @places = Place.all.order(id: "DESC").page(params[:page]).per(10)
    # @places.each do |place|
    #   @likes_count = Favorite.where(place_id: place.id).count
    # end
  end
  
  def show
    @place = Place.find(params[:id])
    @likes_count = Favorite.where(place_id: @place.id).count
    
    @picture = @place.pictures.build
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
    @place = Place.find(params[:id])
    @place.destroy
    flash[:success] = "投稿を削除しました。"
    redirect_to user_path(current_user)
  end
  
  def search
    @q = Place.ransack(params[:q])
    @places = @q.result.page(params[:page]).per(10)
  end
  private
  
  def place_params
    params.require(:place).permit(:prefecture, :address, :spot, :detail, :rate, post_files_attributes: [:file])
  end
  
  def correct_user
    @place = Place.find(params[:id])
    unless @place.user_id == current_user.id
      redirect_to user_path(current_user)
    end
  end
end
