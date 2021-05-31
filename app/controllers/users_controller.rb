class UsersController < ApplicationController
  before_action :authorized, only: [:me]

  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      UserProfile.create(first_name:user_profile_params.first_name,last_name:user_profile_params.last_name,   user_id:@user.id)
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end


  def me
    render json: @user
  end

  private
  def user_params
    params.permit(:username, :password,:age, :first_name, :last_name)
  end

  private
  def user_profile_params
    params.permit(:age, :first_name, :last_name)
  end
end
