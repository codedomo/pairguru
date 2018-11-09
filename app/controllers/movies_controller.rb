class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:send_info]

  def index
    @movies = Rails.cache.fetch("all_movies", expires_in: 1.hour) do
      Movie.includes(:genre).all.decorate.to_a
    end
  end


  def show
    @movie = Movie.includes(:comments).find(params[:id]).decorate
  end

  def send_info
    @movie = Movie.find(params[:id])
    MovieInfoMailer.send_info(current_user, @movie).deliver_later
    redirect_back(fallback_location: root_path, notice: "Email sent with movie info")
  end

  def export
    file_path = "tmp/movies.csv"
    MovieExporterJob.perform_later(current_user, file_path)
    redirect_to root_path, notice: "Movies exported"
  end
end
