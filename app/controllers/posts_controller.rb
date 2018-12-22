class PostsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user_for_posts , only: [:edit,:update,:destroy]
  def index
    @posts = Post.all.order("updated_at DESC").page(params[:page]).per(12)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params) #buildは慣習
    if @post.save
      flash[:success] = "投稿を作成しました."
      redirect_to "/posts/show/#{@post.id}"
    else
      render 'new'
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
    @comment = Comment.new
    @comments = @post.comments.page(params[:page]).per(5)
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      flash[:success] = "編集が完了しました."
      redirect_to "/posts/show/#{@post.id}"
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find_by(id:params[:id])
    @post.destroy
    redirect_to current_user
  end

  private
    def post_params
      params.require(:post).permit(:title,:content,:image)
    end

    def correct_user_for_posts
      @post = Post.find(params[:id])
      redirect_to "/posts/show/#{@post.id}" unless @post.user == current_user
    end

end
