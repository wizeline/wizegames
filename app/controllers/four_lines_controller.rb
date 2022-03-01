# frozen_string_literal: true

class FourLinesController < ApplicationController
  def index
    @four_lines = FourLine.all
  end

  def show
    @four_line = FourLine.find params[:id]
  end

  def create
    redirect_to FourLine.create
  end
end
