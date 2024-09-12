class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:profile_id, :username, :comment, :mbti, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:profile_id, :username, :comment, :mbti, :image])
  end

  private
  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource_or_scope)
    mypage_path  #ここを好きなパスに変更
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    root_path #ここを好きなパスに変更
  end
end
