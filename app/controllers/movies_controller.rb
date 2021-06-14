class MoviesController < ApplicationController
  def index
    if params[:genre] == "php"
      @movies = Movie.where(genre: :php).includes(:watch_progresses)
      @title = "PHP動画"
    else
      @movies = Movie.where(genre: Movie::RAILS_GENRE_LIST).includes(:watch_progresses)
      @title = "Ruby/Rails 動画"
    end
    # @movies = Movie.where(genre: Movie::RAILS_GENRE_LIST).includes(:watch_progresses)
  end
end
