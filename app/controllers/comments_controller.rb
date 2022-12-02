class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]

  def create
    comment_params = params.require(:comment).permit(:title, :content, :blog_id)

    @comment = Comment.new(comment_params)
    @blog = Blog.find(params[:blog_id])

    @comment.blog = @blog
    @comment.save

    redirect_to blog_url(params[:blog_id]), notice: 'Create comment successfully'
  end

  def edit
    @blog = @comment.blog
  end

  def update
    comment_params = params.require(:comment).permit(:title, :content)

    if @comment.update(comment_params)
      redirect_to blog_url(@comment.blog_id), notice: 'Update Comment successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog = @comment.blog

    @comment.destroy

    if @blog.nil?
        redirect_to blogs_url, notice: "Delete comment successfully!"
      else
        redirect_to blog_url(@blog), notice: "Delete comment successfully!"
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
