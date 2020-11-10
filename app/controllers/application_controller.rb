class ApplicationController < ActionController::Base
  before_action :get_current_user

  def get_current_user
    @current_user = User.find_by(user_id: session[:user_id])
  end

  def redirect_authorized
    if @current_user != nil
      flash[:notice] = "すでにサインインしています。"
      redirect_to "/search"
    end
  end

  def redirect_unauthorized
    if @current_user == nil
      flash[:alert] = "サインインが必要です。"
      redirect_to "/signin"
      return true
    end
  end

  def redirect_nonadmin
    if redirect_unauthorized
      return
    end

    if @current_user.kind != "admin"
      redirect_to "/"
    end
  end
end
