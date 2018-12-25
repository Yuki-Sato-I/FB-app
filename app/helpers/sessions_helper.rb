module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

    # 記憶トークンcookieに対応するユーザーを返す
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
  
  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end

  # 永続的セッションを破棄する
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def current_user?(user)
    user == current_user
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  # 記憶したURL (もしくはデフォルト値) にリダイレクト
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # アクセスしようとしたURLを覚えておく
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  #ログイン済みかどうか確認する
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください."
      redirect_to '/'
    end
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to '/' unless current_user?(@user)
  end
  
  def admin_user
    logged_in_user
    if current_user
      redirect_to current_user unless current_user.admin?
    end
  end

  def degree(num,lang)
    if num != 0 && num < 5 
      return ["初めての#{lang}", "medal01"]
    elsif num < 10
      return ["#{lang}初心者", "medal02"]
    elsif num < 20
      return ["#{lang}する人", "medal03"]
    elsif num < 50
      return ["#{lang}中級者", "medal04"]
    elsif num < 100
      return ["#{lang}上級者","medal05"]
    elsif num > 100
      return ["#{lang}マスター","medal06"]
    else
      return
    end
  end

end
