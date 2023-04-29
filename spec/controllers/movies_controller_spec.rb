require 'rails_helper'

RSpec.describe "Movies", type: 'request' do
  describe "POST /share" do
    context "with valid parameters" do
      let(:user) { User.create(email: "johnny@exmaple.com") }
      let(:valid_params) do
        {
          movie: {
            url: 'https://www.youtube.com/watch?v=3S9fyfmCf1A',
            description: 'PART 1 - Returning JSON DATA',
            youtube_id: '3S9fyfmCf1A',
            title: 'Create a Basic API with Ruby on Rails - Part 1 - Returning JSON Data',
            user_id: user.id
          }
        }
      end

      it "creates a new movie" do
        expect { post "/share", params: valid_params }.to change(Movie, :count).by(+1)
      end
    end

    context "with invalid parameters" do
      let(:user) { User.create(email: "johnny@exmaple.com") }
      let(:invalid_params) do
        {
          movie: {
            url: '',
            description: 'PART 1 - Returning JSON DATA',
            youtube_id: '3S9fyfmCf1A',
            title: 'Create a Basic API with Ruby on Rails - Part 1 - Returning JSON Data',
            user_id: user.id
          }
        }
      end

      before { allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user) }

      it "creates a new movie" do
        expect { post "/share", params: invalid_params }.not_to change(Movie, :count)
      end
    end
  end
end
