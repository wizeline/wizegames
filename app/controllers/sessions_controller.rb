# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create; end

  def destroy
    session[:oktastate] = nil
    redirect_to '/sign_in'
  end

  def failure; end
end
