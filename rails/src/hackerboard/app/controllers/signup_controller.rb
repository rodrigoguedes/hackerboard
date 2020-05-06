class SignupController < ApplicationController
  layout "window"
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # TODO: Improvement the send email using sidekiq (background process)
      WelcomeMailer.welcome(@user.email, @user.name).deliver

      redirect_to login_path,
        notice: t("flash.signup.create.notice")
    else
      render :new
    end
  end

  private
  def user_params
    params
      .require(:user)
      .permit(:name, :email, :password, :password_confirmation)
  end
end