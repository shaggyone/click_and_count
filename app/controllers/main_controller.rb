class MainController < ApplicationController
  def show
    @lines_count = Line.count
  end
end
