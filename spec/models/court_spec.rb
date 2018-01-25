require 'rails_helper'

RSpec.describe Court, type: :model do
    let(:court) { create(:court) }

    # Shoulda tests
    it { is_expected.to have_many(:games) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:street_number) }
    it { is_expected.to validate_presence_of(:street_name) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:zip_code) }
    it { is_expected.to validate_presence_of(:latitude) }
    it { is_expected.to validate_presence_of(:longitude) }

    it { is_expected.to validate_presence_of(:google_places_id) }
    it { is_expected.to validate_uniqueness_of(:google_places_id) }

    describe "attributes" do
        it "should have name attribute" do
            expect(court).to have_attributes(name: court.name)
        end

        it "should have street_number attribute" do
            expect(court).to have_attributes(street_number: court.street_number)
        end

        it "should have street_name attribute" do
            expect(court).to have_attributes(street_name: court.street_name)
        end

        it "should have city attribute" do
            expect(court).to have_attributes(city: court.city)
        end

        it "should have state attribute" do
            expect(court).to have_attributes(state: court.state)
        end

        it "should have zip_code attribute" do
            expect(court).to have_attributes(zip_code: court.zip_code)
        end

        it "should have latitude attribute" do
            expect(court).to have_attributes(latitude: court.latitude)
        end

        it "should have longitude attribute" do
            expect(court).to have_attributes(longitude: court.longitude)
        end
    end
end
