class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie, only: [:create, :destroy]

  def create
    @comment = @movie.comments.create(comment_params.merge(user_id: current_user.id))
    if @comment.errors.any?
      render "movies/show"
    else
      redirect_to movie_path(@movie)
    end
  end

  def destroy
    current_user.comments.destroy(params[:id])
    redirect_to movie_path(@movie)
  end

  private

  def comment_params
    params.require(:comment).permit(:movie_id, :content)
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
