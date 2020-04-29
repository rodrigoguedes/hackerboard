class LoginController < ApplicationController
  def new
  end

  def create
    @user = User.where(email: params[:email].to_s).first

    if @user && @user.authenticate(params[:password].to_s)
      reset_session
      session[:user_id] = @user.id

      redirect_to home_path
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