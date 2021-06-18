class SheetsController < ApplicationController
    protect_from_forgery with: :exception

    

    # GET /sheets
    def index
        @sheets = Sheet.all()
    end

   
end