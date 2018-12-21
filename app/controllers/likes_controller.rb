class LikesController < ApplicationController
  def create
    unless @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
      @like = Like.new(user_id: current_user.id, post_id: params[:post_id])
      @like.save
    end
    redirect_to "/posts/show/#{params[:post_id]}"
  end

  def destroy
    if @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
      @like.destroy
    end
    redirect_to "/posts/show/#{params[:post_id]}"
  end
end