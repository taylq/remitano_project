require 'rails_helper'

RSpec.describe "Ratings", type: 'request' do
  describe "POST /vote" do
    context "with valid parameters" do
      let(:user) { User.create(email: "johnny@exmaple.com") }
      let(:movie) { Movie.create({
                                   url: 'https://www.youtube.com/watch?v=3S9fyfmCf1A',
                                   description: 'PART 1 - Returning JSON DATA',
                                   youtube_id: '3S9fyfmCf1A',
                                   title: 'Create a Basic API with Ruby on Rails - Part 1 - Returning JSON Data',
                                   user_id: user.id})}
      let(:valid_params) do
        {
          rating: {
            is_voted_up: true,
            movie_id: movie.id,
            user_id: user.id
          }
        }
      end

      it "creates a new rating" do
        expect { post "/vote", params: valid_params }.to change(Rating, :count).by(+1)
      end
    end

    context "with invalid parameters" do
      let(:user) { User.create(email: "johnny@exmaple.com") }
      let(:movie) { Movie.create({
                                   url: 'https://www.youtube.com/watch?v=3S9fyfmCf1A',
                                   description: 'PART 1 - Returning JSON DATA',
                                   youtube_id: '3S9fyfmCf1A',
                                   title: 'Create a Basic API with Ruby on Rails - Part 1 - Returning JSON Data',
                                   user_id: user.id})}
      let(:invalid_params) do
        {
          rating: {
            is_voted_up: true,
            movie_id: movie.id,
          }
        }
      end

      it "creates a new rating" do
        expect { post "/vote", params: invalid_params }.not_to change(Rating, :count)
      end
    end
  end

  describe "POST /unvote" do
    context "with valid parameters" do
      let(:user) { User.create(email: "johnny@exmaple.com") }
      let(:movie) { Movie.create({
                                   url: 'https://www.youtube.com/watch?v=3S9fyfmCf1A',
                                   description: 'PART 1 - Returning JSON DATA',
                                   youtube_id: '3S9fyfmCf1A',
                                   title: 'Create a Basic API with Ruby on Rails - Part 1 - Returning JSON Data',
                                   user_id: user.id})}
      let(:rating) { Rating.create(is_voted_up: true,
                                   movie_id: movie.id,
                                   user_id: user.id)}
      let(:valid_params) do
        {
          movie_id: movie.id,
          user_id: user.id
        }
      end
      it "creates a new rating" do
        expect { post "/unvote", params: valid_params }.to change(Rating, :count).by(0)
      end
    end

    context "with invalid parameters" do
      let(:user) { User.create(email: "johnny@exmaple.com") }
      let(:movie) { Movie.create({
                                   url: 'https://www.youtube.com/watch?v=3S9fyfmCf1A',
                                   description: 'PART 1 - Returning JSON DATA',
                                   youtube_id: '3S9fyfmCf1A',
                                   title: 'Create a Basic API with Ruby on Rails - Part 1 - Returning JSON Data',
                                   user_id: user.id})}
      let(:rating) { Rating.create(is_voted_up: true,
                                   movie_id: movie.id,
                                   user_id: user.id)}
      let(:valid_params) do
        {
          movie_id: movie.id,
        }
      end
      it "creates a new rating" do
        expect { post "/unvote", params: valid_params }.not_to change(Rating, :count)
      end
    end

  end
end
