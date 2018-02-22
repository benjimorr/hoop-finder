class CourtsController < ApplicationController
    def new
        @court = Court.new
    end

    def create
        build_or_find_court

        if @court.save
            flash[:notice] = "Selected court: #{@court.name}. Please finish creating your game."
            redirect_to new_game_path(:court_id => @court.id)
        else
            flash.now[:alert] = "There was an error selecting the court. Please try again."
            render :new
        end
    end

    def destroy
    end

    private
    def build_or_find_court
        if Court.where(google_places_id: court_params[:google_places_id]).size > 0
            @court = Court.where(google_places_id: court_params[:google_places_id])[0]
        else
            street_number, street_name, city, state, zip_code = format_address
            @court = Court.new(name: court_params[:name], street_number: street_number, street_name: street_name, city: city, state: state, zip_code: zip_code, latitude: court_params[:latitude], longitude: court_params[:longitude], google_places_id: court_params[:google_places_id])
        end
    end

    def format_address
        address = court_params[:address].split(', ')
        street_number = address[-4].match(/^\d{1,}-?\d{1,}/).to_s.tr("-", "").to_i
        street_name = address[-4].match(/[a-zA-Z\s&]{1,}/).to_s.lstrip
        city = address[-3]
        state = address[-2].split(' ')[0]
        zip_code = address[-2].split(' ')[1].to_i
        return street_number, street_name, city, state, zip_code
    end

    def court_params
        params.permit(:google_places_id, :name, :address, :latitude, :longitude, :authenticity_token)
    end
end
