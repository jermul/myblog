class CommentsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def create
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.build(params[:comment])
    @comment.user = current_user
    @comment.save
    flash[:success] = "Comment created" if @comment.save
  	redirect_to post_path(@post)
  end

  def destroy
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.find(params[:id])
  	@comment.destroy
  	redirect_to post_path(@post)
  end
end
