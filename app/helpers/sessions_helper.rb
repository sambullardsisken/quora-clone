module SessionsHelper
  def current_user
    return nil unless session[:session_token]
    User.find_by_session_token(session[:session_token])
  end

  def login(user)
    user.session_token = SecureRandom.base64(16)
    user.save
    session[:session_token] = user.session_token
  end

  def logout
    unless logged_in?
      redirect_to new_session_url
      return
    end

    u = current_user
    u.session_token = nil
    u.save
    session[:session_token] = nil
    redirect_to new_session_url
  end

  def logged_in?
    !!current_user
  end

end
