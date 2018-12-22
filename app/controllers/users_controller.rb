class UsersController < ApplicationController
  before_action :logged_in_user,only: [:edit,:update,:show,:index]
  before_action :correct_user, only:[:edit, :update]
  before_action :admin_user, only: [:index,:destroy]

  def index
    @users = User.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(5).order("updated_at DESC")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the FB-App"
      redirect_to @user
    else
      render 'home/top'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(edit_user_params)
      flash[:success] = "プロフィールを変更しました."
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def edit_user_params
    params.require(:user).permit(:name,:image,:profile)
  end
end
