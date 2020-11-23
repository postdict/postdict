class HomeController < ApplicationController
  before_action :redirect_authorized

  def top
  end

  # @override
  def redirect_authorized
    if !@current_user.nil?
      redirect_to "/search"
    end
  end
end
