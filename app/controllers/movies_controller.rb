class MoviesController < ApplicationController
  def index
    @movies = Movie.genre_classification(params[:genre])
  end
end
