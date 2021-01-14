class UsersController < ApplicationController
  before_action :require_user_logged_in, only:[:index, :show, :edit, :update, :destroy]
  before_action :correct_user, only:[:edit, :update, :destroy]
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @places = @user.places
    counts(@user)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザを登録しました。"
      redirect_to login_path
    else
      flash.now[:danger] = "ユーザの登録に失敗しました。"
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(edit_params)
      flash[:success] = "プロフィールを更新しました。"
      redirect_to user_path(@user)
    else
      flash.now[:danger] = "プロフィールを更新できませんでした。"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "ユーザーを削除しました。"
    redirect_to root_url
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page]).per(10)
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page]).per(10)
    counts(@user)
  end
  
  def likes
    @user = User.find(params[:id])
    @favorites = @user.find_favorites.page(params[:page]).per(10)
    counts(@user)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :gender, :email, :password, :password_confirmation)
  end
  
  def edit_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :comments, :image, :view)
  end
  
  def correct_user
    user = User.find_by(id: params[:id])
    unless user == current_user
      redirect_to user_path(current_user)
    end
  end
end
