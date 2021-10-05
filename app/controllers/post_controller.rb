class PostController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def new
        @post = current_user.posts.build
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            flash[:notice] = "Post created!"
            redirect_to root_path
        else
            flash[:alert] = "Post can't be empty."
            redirect_to root_path
        end
    end

    def index
        @posts = Post.all
    end

    private 
    def post_params
        {:content => params[:content]}
    end

end
