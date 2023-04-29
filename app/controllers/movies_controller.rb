class MoviesController < ApplicationController
  def index
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      flash[:notice] = "Share movie success!"
      redirect_to root_path
    else
      flash[:alert] = @movie.errors.full_messages.join(", ")
      render :index, status: :unprocessable_entity
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:url, :user_id)
  end
end
