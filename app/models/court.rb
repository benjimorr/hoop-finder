class Court < ApplicationRecord
    validates :name, presence: true
    validates :street_number, presence: true
    validates :street_name, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :zip_code, presence: true
    validates :latitude, presence: true
    validates :longitude, presence: true

    validates :google_places_id, presence: true, uniqueness: true
end
