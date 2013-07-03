class LinesController < ApplicationController
  respond_to :json
  def create
    @line = Line.new(params[:line])

    if @line.save
      respond_to do |format|
        format.json { render json: LinesSerializer.new(@line) }
      end
    else
      respond_to do |format|
        format.json { render json: @line }
      end
    end
  end
end
