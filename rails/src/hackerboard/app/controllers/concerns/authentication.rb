module Authentication
  extend ActiveSupport::Concern

  included do
    helper_method :current_user, :logged_in?
  end

  private
  def current_user
    @current_user = @current_user || User.where(id: session[:user_id]).first if session[:user_id]
    @current_user ||= User.where(id: session[:user_id]).first if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end