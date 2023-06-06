class ApplicationController < ActionController::Base
  before_action :myaction
  after_action :user_activity

  def myaction
    cookies.encrypted[:user_id] = current_user.try(:id)
  end
  private

  def user_activity
      current_user.try :touch
  end
end
