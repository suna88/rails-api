class ApplicationController < ActionController::API
  before_action :auth

  def auth
    user_name = request.headers['user-name']
    user_token = request.headers['user-token']

    @current_user = User.find_by(name: user_name, token: user_token)
    if @current_user.blank?
      return render json: {error: 'Authentication failed.'}, status: 401
    end
  end
end
