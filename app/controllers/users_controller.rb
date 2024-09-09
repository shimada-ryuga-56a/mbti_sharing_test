class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_user, only: [:edit]
  
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).order("created_at desc")
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
    params.require(:user).permit(:username, :profile_id, :user_image_cache)
  end

  def ensure_user
    @user = User.find(params[:id])
    unless @user == current_user
      flash[:danger] = "You have no authority for the page"
      redirect_to(root_url)
    end
  end
end
