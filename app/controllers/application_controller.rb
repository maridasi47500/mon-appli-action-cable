class ApplicationController < ActionController::Base
  before_action :myaction
  def myaction
    cookies.encrypted[:user_id] = current_user.id
  end
end
