class Movie < ApplicationRecord
  has_many :watch_progresses, dependent: :destroy

  def watched_by?(user)
    watch_progresses.any? { |watch_progress| watch_progress.user_id == user.id }
  end

  def self.genre_classification(genre)
    if genre == "php"
      where(genre: :php).includes(:watch_progresses)
      # @title = "PHP動画"
    else
      where(genre: Movie::RAILS_GENRE_LIST).includes(:watch_progresses)
      # @title = "Ruby/Rails 動画"
    end
  end

  def page_title
    if genre == "php"
      "php"
    else
      "rails"
    end
  end

  with_options presence: true do
    validates :genre
    validates :title
    validates :url
  end

  enum genre: {
    invisible: 0, # 非表示
    basic: 1,
    git: 2,
    ruby: 3,
    rails: 4,
    php: 5
  }

  RAILS_GENRE_LIST = %w[basic git ruby rails].freeze
end
