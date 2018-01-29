require 'rails_helper'

RSpec.describe GamesController, type: :controller do
    let(:user) { create(:user) }
    let(:court) { create(:court) }
    let(:game) { create(:game, court: court) }
    let(:user_creator) { UserGame.create(user: user, game: game, creator: true) }

    before do
        sign_in user
    end

    describe "GET #index" do
        it "returns HTTP success" do
            get :index
            expect(response).to have_http_status(:success)
        end

        it "assigns [game] to @games" do
            get :index
            expect(assigns(:games)).to eq([game])
        end
    end
end
