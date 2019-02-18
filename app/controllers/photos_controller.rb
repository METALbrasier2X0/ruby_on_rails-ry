class PhotosController < ApplicationController
    def index
        @photos = Photo.where(user_id: params[:user_id])
    end

    def edit
        @photo = Photo.find(params[:id])
    end

    def show
        @photo = Photo.find(params[:id])
    end

    def new
        @photo = Photo.new
        @user = User.find(params[:user_id])
    end

    def create
        @user = User.find(params[:user_id])
        photo_params = params.require(:photo)
        photo_params = photo_params.permit(:image, :title)
        @photo = @user.photos.create(photo_params)
        redirect_to "/users/#{params[:user_id]}/photos"
    end
end
