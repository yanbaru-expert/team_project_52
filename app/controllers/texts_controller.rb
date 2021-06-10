class TextsController < ApplicationController
  def index
    @texts = Text.where(genre: Text::RAILS_GENRE_LIST).order(id: :asc)
  end

  def show; end
end
