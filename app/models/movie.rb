class Movie < ApplicationRecord
  with_options presence: true do
    validates :genre
    validates :title
    validates :content
  end
end
