class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def oktaoauth
    @user = User.from_omniauth(request.env["omniauth.auth"])
    session[:oktastate] = request.env["omniauth.auth"]["uid"]
    redirect_to root_path
  end
end