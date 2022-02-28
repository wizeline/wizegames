class HomeController < ApplicationController
  before_action :user_is_logged_in?

  def index
  end
end
