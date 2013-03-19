class PostsController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).paginate(page: params[:page])
    else
      @posts = Post.search(params[:search], params[:page])
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = current_user.comments.build if signed_in?
    @comments = @post.comments.paginate(page: params[:page], per_page: 50)
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:success] = "Post created"
      redirect_to posts_url
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:success] = "Post updated"
      redirect_to posts_url
    else
      render 'edit'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post destroyed"
    redirect_to posts_url
  end
end
