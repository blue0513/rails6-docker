class SessionsController < ApplicationController
  include JwtHelper

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in(user)

      encoded_token = cookies[:aoki_jwt]
      puts '-------------'
      puts decode_jwt(encoded_token)
      puts '-------------'

      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
