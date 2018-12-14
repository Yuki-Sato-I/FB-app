class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'invalid email/password combination'
      @user = User.new
      render 'home/top'
    end
  end

  def destroy
    log_out
    redirect_to '/'
  end
end
