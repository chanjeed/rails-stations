class MoviesController < ApplicationController
    protect_from_forgery with: :exception

    

    # GET /admin/movies
    def index
      @movies = Movie.all()
      case params[:is_showing]
      when nil
        @movies = Movie.search(params[:name])
      when ""
        @movies = Movie.search(params[:name])
      else
        @movies = Movie.search(params[:name]).where(is_showing: params[:is_showing])
      end
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
        :is_showing => params[:movie][:is_showing].to_i,
        :image_url => params[:movie][:image_url]
        )
        redirect_to movies_path
      rescue => e
        
        redirect_to movies_new_path, flash: { error: "error #{e.class}" }
  
      end

    end

    # GET /admin/movies/:id/edit
    def edit
      @movie = Movie.find(params[:id])
    end
    
    # POST /admin/movies/:id/edit
    def update
      begin
        @movie = Movie.find(params[:id])
        @movie.update(:name => params[:movie][:name],
        :year => params[:movie][:year],
        :description => params[:movie][:description],
        :is_showing => params[:movie][:is_showing].to_i,
        :image_url => params[:movie][:image_url])
        redirect_to movies_path
      rescue => e
        redirect_to edit_movie_path, flash: { error: "error #{e.class}" }
      end
    end

    # DELETE /admin/movies/:id/
    def destroy
   
        Movie.find(params[:id]).destroy
        redirect_to movies_path, flash: { alert: "Delete movie##{params[:id]}" }
     
    end

   
end