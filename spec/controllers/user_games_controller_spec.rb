require 'rails_helper'

RSpec.describe UserGamesController, type: :controller do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }
    let(:court) { create(:court) }
    let(:game) { create(:game, court: court) }
    let(:user_creator) { UserGame.create(user: user, game: game, creator: true) }

    before do
        sign_in user
        sign_in other_user
    end

    describe "POST #create" do
        context "when the game is not full" do
            it "increases the number of players in game by 1" do
                expect{ post :create, params: { user_id: other_user.id, game_id: game.id }}.to change(UserGame, :count).by(1)
            end

            it "assigns the new user_game to @user_game" do
                post :create, params: { user_id: other_user.id, game_id: game.id }
                expect(assigns(:user_game)).to eq UserGame.last
            end

            it "refreshes the game show view" do
                post :create, params: { user_id: other_user.id, game_id: game.id }
                expect(response).to redirect_to game
            end
        end

        context "when the game is full" do
            before do
                9.times do
                    UserGame.create!(user: user, game: game)
                end
            end

            it "does not allow player to join the game" do
                post :create, params: { user_id: other_user.id, game_id: game.id }
                expect(game.users.count).to eq 10
                expect(flash.now[:alert]).to eq("This game is full and you cannot join.")
            end


            it "refreshes the game show view" do
                post :create, params: { user_id: other_user.id, game_id: game.id }
                expect(response).to redirect_to game
            end
        end
    end

    describe "DELETE #destroy" do
        let(:other_user_rsvp) { UserGame.create(user: other_user, game: game) }

        it "deletes the player from the game" do
            delete :destroy, params: { id: other_user_rsvp.id }
            count = UserGame.where({id: other_user_rsvp.id}).size
            expect(count).to eq(0)
        end

        it "redirects to the game index view" do
            delete :destroy, params: { id: other_user_rsvp.id }
            expect(response).to redirect_to games_path
        end
    end
end
