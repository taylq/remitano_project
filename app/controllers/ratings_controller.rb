class RatingsController < ApplicationController
  before_action :find_ratings, only: :destroy
  def create
    @rating = Rating.new(rating_params)
    respond_to do |format|
      if @rating.save
        format.html { redirect_to root_path}
      else
        format.html { render json: {status: :unprocessable_entity}}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @ratings.destroy_all
        format.html { redirect_to root_path }
        format.json { render json: @ratings }
      else
        format.json { render json: {status: :unprocessable_entity}}
      end
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:user_id, :movie_id, :is_voted_up)
  end

  def find_ratings
    @ratings = Rating.where(user_id: params[:user_id], movie_id: params[:movie_id])
  end
end
