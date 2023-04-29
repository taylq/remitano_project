class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  after_create :calculate_vote
  after_destroy :calculate_vote

  def calculate_vote
    ratings = Rating.where(movie_id: movie_id)
    vote_up = 0
    vote_down = 0
    ratings.each do |rating|
      vote_up += 1 if rating.is_voted_up
      vote_down += 1 if !rating.is_voted_up
    end
    movie = Movie.find_by_id(movie_id)
    movie.update(vote_up: vote_up, vote_down: vote_down)
  end
end
