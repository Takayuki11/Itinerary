class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
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

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "ユーザーを削除しました。"
    redirect_to root_url
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :gender, :email, :password, :password_confirmation)
  end
end
