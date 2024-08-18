class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_user, only: [:edit]
  
  def index
    @users = User.all
  end

  def mypage
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def edit; end

  private

  def user_params
    params.require(:user).permit(:username, :profile_id)
  end

  def ensure_user
    @user = User.find(params[:id])
    unless @user == current_user
      flash[:danger] = "You have no authority for the page"
      redirect_to(root_url)
    end
  end
end
