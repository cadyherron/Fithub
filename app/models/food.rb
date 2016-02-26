class Food < ActiveRecord::Base
  belongs_to :meal


  def all_calories_all_users
    sum(:calories)
  end






end
