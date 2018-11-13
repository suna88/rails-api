class UsersController < ApplicationController
  skip_before_action :auth, only: [:create]
  def index
    users = User.all
    render json: users
  end

  def my_page
    if @current_user
      render json: user_response_hash(@current_user)
    else
      render plain: 'not found'
    end
  end

  def show
    render json: user_response_hash(@user)
  end

  def create
    @user = User.new(user_params)

    logger.debug(@user.inspect)
    if @user.save
      render json: user_response_hash(@user)
    else
      render json: {error: 'Authentication failed.'}, status: 401
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
        :name,
        :password,
        :password_confirmation,
        :token
    )
  end

  def user_response_hash(user)
    {
        id: user.id,
        name: user.name,
        token: user.token
    }
  end
end
