class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :admin

  def admin
    current_user.admin if current_user
  end

  def authenticate_admin
    unless admin()
      redirect_to new_user_session_path, :notice => "You need to sign in or sign up before continuing."
      false
    end
  end
end
