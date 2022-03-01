# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def user_is_logged_in?
    if !session['oktastate']
      redirect_to user_oktaoauth_omniauth_authorize_path
    else
      @current_user = User.find_by(uid: session[:oktastate])
    end
  end

  def after_sign_in_path_for(_resource)
    request.env['omniauth.origin'] || root_path
  end
end
