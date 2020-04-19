module SessionsHelper
  include JwtHelper

  def log_in(user)
    session[:user_id] = user.id
    cookies.permanent[:aoki_jwt] = generate_jwt
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
