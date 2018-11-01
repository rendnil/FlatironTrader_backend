class Api::V1::AuthController < ApplicationController
  #skip_before_action :authorized, only: [:create]
  skip_before_action :authorized


#####check if user exists
  def create
    @user = User.find_by(username: user_login_params[:username])

    if @user && (@user.password_digest == user_login_params[:password])
      render json: { user: UserSerializer.new(@user)}
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end

  end

   def user_login_params
  #   # params { user: {username: 'Chandler Bing', password: 'hi' } }
    params.require(:user).permit(:username, :password)
   end


end


##########Auth methods
# def create
#   @user = User.find_by(username: user_login_params[:username])
#   #User#authenticate comes from BCrypt
#   if @user && @user.authenticate(user_login_params[:password])
#     # encode token comes from ApplicationController
#     token = encode_token({ user_id: @user.id })
#     render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
#   else
#     render json: { message: 'Invalid username or password' }, status: :unauthorized
#   end
# end
#
# private
#
# def user_login_params
#   # params { user: {username: 'Chandler Bing', password: 'hi' } }
#   params.require(:user).permit(:username, :password)
# end
