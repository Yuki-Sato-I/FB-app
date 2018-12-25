class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message  = "アカウントが有効化されていません. "
        message += "メールを確認し、有効化リンクをクリックしてください."
        flash[:warning] = message
        redirect_to '/'
      end
    else
      flash.now[:danger] = 'パスワードとメールの組み合わせが正しくありません.'
      @user = User.new
      render 'home/top'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to '/'
  end
end
