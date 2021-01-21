class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "ログインに聖光学院しました"
      user_path(current_user)
    else
      flash[:notice] = "新規会員登録完了しました"
      user_path(current_user)
    end
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end
