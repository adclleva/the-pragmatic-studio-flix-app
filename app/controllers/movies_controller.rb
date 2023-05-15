class MoviesController < ApplicationController
  def index
    # we defined released in the Movies models class
    @movies = Movie.released
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    # redirect_to movie_path(@movie) => another way of redirecting
    redirect_to @movie
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save
    redirect_to @movie
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    # it's recommended to use redirects with _ url
    redirect_to movies_url, status: :see_other
  end

  private

  def movie_params
    params.require(:movie).permit(
      :title, :description, :rating, :released_on, :total_gross
    )
  end

end
