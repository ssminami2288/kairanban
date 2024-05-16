class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth

  protected

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(_resource)
    posts_path
  end

  def authenticate_admin!
    return if current_user&.admin?

    flash[:alert] = '管理者のみアクセスできます。'
    redirect_to root_path
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :first_name, :last_name, :room_number])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == "1111"
    end
  end
end
