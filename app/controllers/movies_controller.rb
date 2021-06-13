class MoviesController < ApplicationController
  def index
    @movies = Movie.where(genre: Movie::RAILS_GENRE_LIST).includes(:watch_progresses)
  end
end
