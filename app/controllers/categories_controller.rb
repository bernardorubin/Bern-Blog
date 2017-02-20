class CategoriesController < ApplicationController

  def create
    category_params    = params.require(:category).permit(:name)
    @category          = Category.new category_params
    @post = Post.find params[:post_id]
    @category.post = @post

    if @category.save
      redirect_to post_path(params[:post_id]), notice: 'category created!'
    else
      flash[:alert] = 'please fix errors'
      render 'posts/show'
    end
  end

  def destroy
    category = Category.find params[:id]
    category.destroy
    redirect_to post_path(category.question_id), notice: 'Category deleted!'
  end


end
