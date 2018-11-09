class LoginController < ApplicationController
  skip_before_action :auth

  def login
    user = User.find_by(name: params[:name])

    if user && user.authenticate(params[:password])
      render json: {
          id: user.id,
          name: user.name,
          token: user.token,
          logged_in_at: Time.zone.now
      }
    else
      render json: {error: 'Authentication failed.'}, status: 401
    end

  end
end
