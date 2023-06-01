class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  validate :unique_bookmark_for_movie_and_list

  private

  def unique_bookmark_for_movie_and_list
    existing_bookmark = Bookmark.find_by(movie: movie, list: list)

    if existing_bookmark && existing_bookmark != self
      errors.add(:base, "Bookmark already exists for this movie and list")
    end
  end
end
