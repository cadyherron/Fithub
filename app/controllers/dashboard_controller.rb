class DashboardController < ApplicationController
  include Analytics

  before_action :require_login


  def index
    average = User.avg_calories_consumed_per_day(current_user)[0]
    @average_per_day = average.avg.to_i unless average.nil? 
  end



  def require_login
    unless signed_in_user?
      redirect_to login_path
    end
  end

end
