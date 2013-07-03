class LinesController < ApplicationController
  respond_to :json

  def create
    @line = Line.create(params[:line])

    respond_to do |format|
      format.json { render json: @line }
    end
  end
end
