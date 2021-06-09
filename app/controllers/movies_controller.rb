class MoviesController < ApplicationController
  def index
    # @movies = Movie.where(genre: Movie::RAILS_GENRE_LIST)
    @movies = Movie.first(4)
  end
end
