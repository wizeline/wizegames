# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :user_is_logged_in?

  def index; end
end
