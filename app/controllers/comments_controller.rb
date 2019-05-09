class CommentsController < ApplicationController
  before_action :find_post
  before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner]
  before_action :comment_owner, only: [:destroy, :edit, :update]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.new(params[:comment].permit(:content))
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to post_path(@post)
    else
      redirect_to post_path
    end
  end

  def edit
  end

  def update
    if @comment.update(params[:comment].permit(:content))
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_owner
    unless current_user.id == @comment.user_id
      flash[:notice] = "You do not have access to this"
      redirect_to @post
    end
  end
end
