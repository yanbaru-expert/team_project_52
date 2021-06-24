class Text < ApplicationRecord
  RAILS_GENRE_LIST = %w[basic git ruby rails].freeze

  has_many :read_progresses, dependent: :destroy

  def read_progressed_by?(user)
    read_progresses.any? { |read_progress| read_progress.user_id == user.id }
  end

  def self.genre_classification(genre)
    if genre == "php"
      where(genre: :php).includes(:read_progresses)
    else
      where(genre: Text::RAILS_GENRE_LIST).includes(:read_progresses)
    end
  end

  with_options presence: true do
    validates :genre
    validates :title
    validates :content
  end

  enum genre: {
    invisible: 0, # 非表示
    basic: 1,
    git: 2,
    ruby: 3,
    rails: 4,
    php: 5
  }
end
