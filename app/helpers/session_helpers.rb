helpers do
  # def login(user)
  #   session[:user_id] = user.id
  # end

  # def log_out
  #   session[:id] = nil
  # end

  # def logged_in?
  #   !current_user.nil?
  # end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end
