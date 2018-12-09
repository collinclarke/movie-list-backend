class MoviesController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new {|c| c.request.format.json? }
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :set_cors, only: [:destroy]

  # GET /movies
  def index
    @movies = Movie.all
    render json: @movies
  end

  # GET /movies/1
  def show
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movies/1
  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movies/1
  def destroy
    if @movie.destroy
      render json: {success: 'success'}
    else
      render json: @movie.errors
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(
        :rating,
        :comment,
        :title
      )
    end

    def set_cors
      headers['Access-Control-Allow-Origin'] = 'http://localhost:4200'
      headers["Access-Control-Allow-Methods"] = "DELETE"
    end
end
