class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit]

    def index
        @posts = Post.all
    end

    def show
      # byebug
      @comments = Comment.where(post_id: @post)
    end

    def new
      if session[:user_id]
          @post = Post.new
      else
          redirect_to(posts_path)
      end
    end

    def create
        @post = Post.new(post_params)

        if @post.save
          UserPost.create(post_id: @post.id, user_id: current_user.id)
          redirect_to post_path(@post)
        else
          # `.errors.full.messages` returns an array of strings
          # flash[:errors] = @post.full_messages
          render :new
        end
    end

    def edit
    end

    def update
    end

    private

    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content)
    end


end
