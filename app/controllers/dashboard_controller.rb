class DashboardController < ApplicationController
  include Analytics

  before_action :require_login


  def index
  end



  def require_login
    unless signed_in_user?
      redirect_to login_path
    end
  end

end
