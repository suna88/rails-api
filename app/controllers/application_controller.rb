class ApplicationController < ActionController::API
  #before_action :auth

  def auth
    user_id = request.headers['user-id']
    user_token = request.headers['user-token']

    @current_user = User.find_by(id: user_id, token: user_token)
    if @current_user.blank?
      return render json: {error: 'Authentication failed.'}, status: 401
    end
  end
end
