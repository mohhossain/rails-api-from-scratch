class MoviesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    def index
        movies = Movie.all
        render json: movies
    end

    # custom error will only work with find_by
    def show
        movie = find_movie
        render json: movie, status: :ok
    end

    def create
        movie = Movie.create!(movie_params)
        render json: movie
    end

    def update
        movie = find_movie
        movie.update!(movie_params)
        render json: movie, status: :ok
        
    end

    def oldest
        movies = Movie.where(year: Movie.minimum('year'))
        render json: movies
    end

    def destroy
        movie = find_movie
        movie.destroy
        head :no_content
        
    end

    private

    def movie_params
        params.permit(:title, :year, :director, :duration, :genre )
    end

    def find_movie
        Movie.find(params[:id])
    end

    def record_not_found
        render json: {error:"Movie not found"}, status: :not_found
    end

    def record_invalid(newobj)
        render json: {error: newobj.record.errors.messages}, status: :u/nprocessable_entity
    end
end
