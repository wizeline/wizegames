# frozen_string_literal: true

class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find params[:id]
  end

  def create
    redirect_to Cat.create
  end
end
