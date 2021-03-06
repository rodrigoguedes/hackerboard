class LoginController < ApplicationController
  layout "window"
  def new
  end

  def create
    @user = User.where(email: params[:email].to_s).first

    if @user && @user.authenticate(params[:password].to_s)
      reset_session
      session[:user_id] = @user.id

      # TODO: Implements test for this class
      redirect_to ReturnTo.new(home_path, params[:return_to]).url
    else
      flash.now[:alert] = t("flash.login.create.alert")
      render :new 
    end
  end

  def destroy
    reset_session
    redirect_to home_path
  end
end