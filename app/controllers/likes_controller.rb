class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_like, only: :destroy
  before_action :find_post, only: :create


  def create
    like = Like.new(user: current_user, post: @post)
    if cannot? :like, @post
      redirect_back fallback_location: posts_path, alert: 'Liking your own post is frowned upon'
      return
    end
    if like.save
      redirect_back fallback_location: posts_path, notice: 'Post liked! 👍'
    else
      redirect_back fallback_location: posts_path, alert: 'Couldn\'t like post 🤙'
    end
  end

  def destroy
    if can? :like, @like.post
        opts = nil
        @like.destroy ? opts = {notice: 'Post Un-liked 👎'} : opts = {alert: @like.errors.full_messages.join(', ')}
        redirect_back fallback_location: posts_path, **opts
    else
      redirect_back fallback_location: posts_path, alert: 'Un-Liking your own post isn\'t allowed'
    end
  end

  def index
    @user = User.find(params[:user_id])
    if @user == current_user
      @posts = @user.liked_posts
    else
      redirect_back fallback_location: posts_path, alert: 'Seeing Other People\'s Likes isn\'t allowed'
    end
  end


  private

  def find_like
    @like ||= Like.find(params[:id])
  end

  def find_post
    @post ||= Post.find(params[:post_id])
  end
end
