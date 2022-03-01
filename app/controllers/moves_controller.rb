class MovesController < ApplicationController
  def create
    @game = Game.find params[:game_id]

    if params[:cat_id].present?
      @cat = Cat.find params[:cat_id]
      @cat.move params[:row], params[:col]
    end

    if params[:four_line_id].present?
      @four_line = FourLine.find params[:four_line_id]
      @four_line.move params[:row], params[:col]
    end

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @game }
    end
  end
end
