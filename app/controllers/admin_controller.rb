class AdminController < ApplicationController
    # GET /admin/movies
    def movies
      @movies = Movie.all
    end
   
end