class MoviesController < ApplicationController
    protect_from_forgery with: :exception
    

    # GET /admin/movies
    def index
      @movies = Movie.all
    end

    # GET /admin/movies/new
    def new
      @movie = Movie.new
    end

    # POST /admin/movies/new
    def create
      begin
        @movie = Movie.create(
        :name => params[:movie][:name],
        :year => params[:movie][:year],
        :description => params[:movie][:description],
        :is_showing => params[:movie][:is_showing],
        :image_url => params[:movie][:image_url]
        )
        redirect_to admin_movies_path
      rescue => e
        
        redirect_to admin_movies_new_path, flash: { error: "error #{e.class}" }
  
      end

    end
   
   
end