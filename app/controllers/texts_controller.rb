class TextsController < ApplicationController
  def index
    @texts = Text.where.not(genre: "php").order(id: :asc)
  end

  def show; end
end
