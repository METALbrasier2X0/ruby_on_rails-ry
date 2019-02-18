class UsersController < ApplicationController
    
    before_action :load_user, only: [:show, :edit, :update]

    def index
        @users = User.all
        if params[:id]
            redirect_to action: "show", id: params[:id]
        end 
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end
    
    def create
        user_params = params.require(:user)
        user_params = user_params.permit(:first_name, :last_name, :birth_date)
        @user = User.create(user_params)
        if @user.valid?
            redirect_to @user
        else
            render new_user_path();
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        user_params = params.require(:user)
        user_params = user_params.permit(:first_name, :last_name, :birth_date)
        user = User.find(params[:id])
        user.update(user_params)
        redirect_to user
    end

    def get_params
        user_params = params.require(:user)
        user_params.permit(:first_name, :last_name, :birth_date)    
    end

    def load_user
        @user = User.find(params[:id])
    end
    
    def destroy
        if session[:user_id] == params[:id]
            @user.destroy()
            redirect_to users_path()
        else
            redirect_to '/404'
        end
    end

end