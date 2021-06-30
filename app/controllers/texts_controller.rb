class TextsController < ApplicationController
  def index
    @texts = Text.genre_classification(params[:genre]).order(id: :asc)
  end

  def show
    @text = Text.find_by(id: params[:id])
  end
end
