  class Api::V1::UsersController < Api::V1::BaseController

  def index
    @users = policy_scope(User)
  end


  def show
    @user = User.find(params[:id])
    authorize @user
  end

  private

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end

end

# class Api::V1::UsersController < ActionController::Base
#  def index
#  @users = User.all
#  render json: @users
#  end
#  def show
#  @user = User.find(params[:id])
#  render json: @user
#  end
#  def create
#  @user = User.create(user_params)
#  render json: @user
#  end
#  private
#  def user_params
#  params.require(:user).permit(:email, :password, :password_confirmation)
#  end
# end


