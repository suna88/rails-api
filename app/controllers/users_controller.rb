class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    logger.debug(@user.inspect)
    if @user.save
      render json: user_response_hash(@user)
    else
      render json: {error:'Authentication failed.'}, status: 401
    end
  end

  private
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
