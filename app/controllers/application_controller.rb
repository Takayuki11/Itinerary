class ApplicationController < ActionController::Base
  before_action :set_search
  
  include SessionsHelper
    
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_places = user.places.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
    @count_favorites = user.favorites.count
  end
  
  def set_search
    @q = Place.ransack(params[:q])
    @Places = @q.result
  end

end
