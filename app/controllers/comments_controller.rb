class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:id].to_i
    if @comment.save
    else
      flash[:danger] = "コメントが書いてありません."
    end
    redirect_to "/posts/show/#{@comment.post_id}"
  end

  def destroy
  end

  private 
   def comment_params
    params.require(:comment).permit(:content)
   end
end
