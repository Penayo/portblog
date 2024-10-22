class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :user_signed_in?
  before_action :require_login

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def current_user
    @current_user ||= session[:user_id] && Account.find_by(id: session[:user_id])
  end

  def require_login
    redirect_to login_path, flash: { danger: "You must be signed in" } if current_user.nil?
  end

  def user_signed_in?
    !current_user.nil?
  end

  def redirect_if_authenticated
    redirect_to root_path, flash: { info: "You are already logged in" } if user_signed_in?
  end
end
