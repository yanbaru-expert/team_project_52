class MoviesController < ApplicationController
  PER_PAGE = 12

  def index
    @movies = Movie.genre_classification(params[:genre]).page(params[:page]).per(PER_PAGE)
  end
end
