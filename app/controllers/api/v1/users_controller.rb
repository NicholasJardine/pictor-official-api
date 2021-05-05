class Api::V1::UsersController < ActionController::Base
 def index
 @users = User.all
 render json: @users
 end
 def show
 @user = User.find(params[:id])
 render json: @user
 end
 def create
 @user = User.create(user_params)
 render json: @user
 end
 private
 def user_params
 params.require(:user).permit(:email, :password, :password_confirmation)
 end
end
