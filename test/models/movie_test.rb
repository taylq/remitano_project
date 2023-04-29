require "test_helper"

class MovieTest < ActiveSupport::TestCase
  test 'valid movie' do
    user = User.create(email: 'john@example.com')
    movie = Movie.new(
      url: 'https://www.youtube.com/watch?v=3S9fyfmCf1A',
      description: 'PART 1 - Returning JSON DATA',
      youtube_id: '3S9fyfmCf1A',
      title: 'Create a Basic API with Ruby on Rails - Part 1 - Returning JSON Data',
      user_id: user.id)
    assert movie.save!
  end

  test 'invalid movie' do
    movie = Movie.new(url: '')
    refute movie.valid?
    assert_not_nil movie.errors[:url], 'no validation error for url present'
  end
end
