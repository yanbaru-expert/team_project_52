class MoviesController < ApplicationController
  PER_PAGE = 12

  def index
    @movies = Movie.where(genre: Movie::RAILS_GENRE_LIST).page(params[:page]).per(PER_PAGE)
    page = @movies.current_page
    @movie_counter = (page - 1) * PER_PAGE
  end
end
