class DashboardController < ApplicationController
  include Analytics

  before_action :require_login


  def index
  end

end
