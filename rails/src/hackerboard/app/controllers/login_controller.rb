class LoginController < ApplicationController
  def new
  end

  def create
    @user = User.where(email: params[:email].to_s).first
    reset_session
    session[:user_id] = @user.id

    redirect_to "/"
  end
end