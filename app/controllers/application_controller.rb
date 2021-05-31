class ApplicationController < ActionController::API
  include Pundit
  before_action :authorized

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  def encode_token(payload)
    JWT.encode(payload, 'biggestSecret')
  end

  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      # header: { 'Authorization': 'Bearer <token>' }
      begin
        JWT.decode(token, 'biggestSecret', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id) ## creates an instance variable than you can access across controller and views
    end
  end

  def logged_in?
    !!logged_in_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

  def current_user
    @user
  end


  private
  def user_not_authorized
    head(:unauthorized)
  end

end

