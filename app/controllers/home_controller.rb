class HomeController < ApplicationController
  def index
    @movies = Movie.all.includes(:ratings).page(params[:page]).per(5)
  end
end
