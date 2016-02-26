class UsersController < ApplicationController
  load_and_authorize_resource

  skip_before_action :require_login,   :only => [ :new, :create ]
  before_action :require_current_user, :only => [ :edit, :update, :destroy ]

  def index
    @users = User.search(params[:query])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      User.delay.send_welcome_email(@user.id)
      sign_in(@user)
      flash[:success] = "Created new user!"
      redirect_to root_url
    else
      flash.now[:error] = "Failed to Create User!"
      render :new
    end
  end

  def show
    @user = User.find( params[:id] )
  end

  def edit
    @user = User.find( params[:id] )
  end

  def upload_avatar
    unless params[:photo_url].empty?
      current_user.photo_url(params[:photo_url])
    else
      current_user.avatar = params[:avatar]
    end

    if current_user.save
      redirect_to current_user
    else

    end
  end

  def update

    if current_user.update(user_params)
      flash[:success] = "Successfully updated your profile"
      redirect_to current_user
    else
      flash.now[:failure] = "Failed to update your profile"
      render :edit
    end
  end

  def destroy
    if current_user.destroy
      sign_out( current_user )
      flash[:notice] = "Destroyed successfully."
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def photo_params
    params.require(:user).permit(:avatar)
  end

  def user_params
    params.require(:user).permit( :first_name, :last_name, :email, :password, :password_confirmation, :avatar, :photo_url)
  end
end
