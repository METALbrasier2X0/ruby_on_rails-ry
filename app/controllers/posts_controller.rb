class PostsController < ApplicationController
    before_action :user_login
    before_action :load_user
    before_action :load_post, only: [ :show, :edit, :update, :creator, :destroy]
    before_action :creator, only: [ :edit, :update, :destroy]

    def user_login
        if !current_user
            redirect_to '/users/sign_in'
        end
    end

    def load_comment
        @comments = @post.comments
    end

    def creator
        @creator = User.find(@post.user_id)
        if @user != @creator
            redirect_to "/422"
        end
    end

    def new
        @post = Post.new
    end

    def load_user
        @user = current_user
    end

    def load_post
        @post = Post.find(params[:id])
    end

    def index
        @posts = Post.all
    end

    def create
        post_params = params.require(:post)
        post_params = post_params.permit(:title, :body, :image)
        @post = @user.posts.create(post_params)
        if @post.valid?
            redirect_to [@user,@post]
        else
            render:new
        end
    end

    def update
        post_params = params.require(:post)
        post_params = post_params.permit(:title, :body, :image)
        if @post.update(post_params)
            redirect_to [@user,@post]
        else
            render:edit
        end
    end

    def show
        @creator = User.find(@post.user_id)
    end 

    def destroy
        @post.delete
        redirect_to @user
    end  

end
