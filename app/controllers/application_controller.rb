# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    cookies[:user_id] = resource.id
    dashboard_path
  end

  def after_sign_up_path_for(resource)
    cookies[:user_id] = resource.id
    dashboard_path
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |u|
      u.permit(:email, :password, :remeber_me)
    end

    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:email, :password, :current_password)
    end
  end
end
