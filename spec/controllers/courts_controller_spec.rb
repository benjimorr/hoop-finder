require 'rails_helper'
require 'faker'

RSpec.describe CourtsController, type: :controller do
    let(:user) { create(:user) }

    before do
        sign_in user
    end

    describe "GET #new" do
        it "returns http success" do
            get :new
            expect(response).to have_http_status(:success)
        end

        it "renders the #new view" do
            get :new
            expect(response).to render_template :new
        end

        it "initializes @court" do
            get :new
            expect(assigns(:court)).not_to be_nil
        end
    end

    describe "POST #create" do
        context "Saving a court not already in the DB" do
            it "increases the number of courts by 1" do
                expect { post :create,
                        params: {name: "Basketball Court",
                        address: "267 Western Ave, Boston, MA 02134, USA",
                        latitude: Faker::Address.latitude,
                        longitude: Faker::Address.longitude,
                        google_places_id: "ChIJeYywIdh544kR76BU-dVb9Bo" } }.to change(Court, :count).by(1)
            end

            it "assigns Court.last to @court" do
                post :create,
                    params: {name: "Basketball Court",
                    address: "267 Western Ave, Boston, MA 02134, USA",
                    latitude: Faker::Address.latitude,
                    longitude: Faker::Address.longitude,
                    google_places_id: "ChIJeYywIdh544kR76BU-dVb9Bo" }
                expect(assigns(:court)).to eq(Court.last)
            end

            it "redirects to the new game page" do
                post :create,
                    params: {name: "Basketball Court",
                    address: "267 Western Ave, Boston, MA 02134, USA",
                    latitude: Faker::Address.latitude,
                    longitude: Faker::Address.longitude,
                    google_places_id: "ChIJeYywIdh544kR76BU-dVb9Bo" }
                expect(response).to redirect_to new_game_path(:court_id => Court.last.id)
            end
        end

        context "Trying to save a court that is in the DB with the same Google Places ID" do
            before do
                post :create,
                    params: {name: "Basketball Court",
                    address: "267 Western Ave, Boston, MA 02134, USA",
                    latitude: Faker::Address.latitude,
                    longitude: Faker::Address.longitude,
                    google_places_id: "ChIJeYywIdh544kR76BU-dVb9Bo" }
            end

            it "does not increase the number of courts by 1" do
                expect { post :create,
                        params: {name: "Basketball Court",
                        address: "267 Western Ave, Boston, MA 02134, USA",
                        latitude: Faker::Address.latitude,
                        longitude: Faker::Address.longitude,
                        google_places_id: "ChIJeYywIdh544kR76BU-dVb9Bo" } }.to change(Court, :count).by(0)
            end

            it "assigns the correct court to @court" do
                post :create,
                    params: {name: "Basketball Court",
                    address: "267 Western Ave, Boston, MA 02134, USA",
                    latitude: Faker::Address.latitude,
                    longitude: Faker::Address.longitude,
                    google_places_id: "ChIJeYywIdh544kR76BU-dVb9Bo" }
                expect(assigns(:court)).to eq(Court.where(google_places_id: "ChIJeYywIdh544kR76BU-dVb9Bo")[0])
            end
        end
    end

    describe "DELETE #destroy" do
        let(:court) { create(:court) }

        it "returns http success" do
            delete :destroy, params: { id: court.id }
            expect(response).to have_http_status(:success)
        end
    end

end
