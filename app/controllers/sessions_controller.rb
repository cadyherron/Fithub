class SessionsController < ApplicationController

  skip_before_action :require_login, :only => [:new, :create]


  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      if params[:remember_me]
        permanent_sign_in(@user)
      else
        sign_in(@user)
      end

      flash[:success] = "You've successfully signed in"
      redirect_to dashboard_path(current_user)
    else
      flash.now[:error] = "We couldn't sign you in"
      logger.info "User login failed..."
      redirect_to root_path
    end
  end

  def destroy
    sign_out
    flash[:success] = "You've successfully signed out"
    redirect_to root_path
  end

end
