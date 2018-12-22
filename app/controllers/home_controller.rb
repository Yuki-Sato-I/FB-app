class HomeController < ApplicationController
  def top
    if current_user
      redirect_to current_user
    else
      @user = User.new
    end
  end

  def terms_of_service
  end

  def policy
  end

end
