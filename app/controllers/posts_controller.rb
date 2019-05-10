class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit]
    helper_method :long_ago


    def index
      @posts = Post.all
    end

    def show
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
      @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to post_path(@post)
      else
        render :edit
      end  
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path
    end
  

    private

    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content)
    end

    def long_ago(seconds)
      if seconds > 86400
        "#{((seconds/86400).round)} days"
      elsif seconds > 3600
        "#{((seconds/3600).round)} hours"
      elsif seconds > 60
        "#{((seconds/60).round)} minutes"
      else
        "#{seconds.round} seconds"
      end
    end


end
