class UsersController < ApplicationController
  before_action :authenticate_user!
  def index; end

  def mypage
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :profile_id)
  end
end
