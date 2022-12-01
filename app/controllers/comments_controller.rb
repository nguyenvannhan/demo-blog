class CommentsController < ApplicationController

  def create 
    comment_params = params.require(:comment).permit(:title, :content, :blog_id)

    @comment = Comment.new(comment_params)
    @blog = Blog.find(params[:blog_id])

    @comment.blog = @blog
    @comment.save

    redirect_to blog_url(params[:blog_id]), notice: "Create comment successfully"
  end

end
