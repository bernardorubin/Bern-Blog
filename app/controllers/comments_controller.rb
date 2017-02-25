class CommentsController < ApplicationController
  before_action :authenticate_user!
def create
  comment_params    = params.require(:comment).permit(:body)
  @comment          = Comment.new comment_params
  @post = Post.find params[:post_id]
  @comment.post = @post
  @comment.user = current_user
  if @comment.save
    redirect_to post_path(params[:post_id]), notice: 'comment created!'
  else
    flash[:alert] = 'please fix errors'
    render 'posts/show'
  end
end

# ajax version
# def create
#   comment_params    = params.require(:comment).permit(:body)
#   @comment          = Comment.new comment_params
#   @post = Post.find params[:post_id]
#   @comment.post = @post
#
#   respond_to do |format|
#     if @comment.save
#       format.html {redirect_to post_path(params[:post_id]), notice: 'comment created!'}
#       format.js
#     else
#       # flash[:alert] = 'please fix errors'
#       # format.html
#     end
#   end
# end

def destroy
  @comment = Comment.find params[:id]
  @comment.destroy
  redirect_to post_path(@comment.post_id), notice: 'Comment deleted!'
end


end
