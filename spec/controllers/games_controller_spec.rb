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

        it "assigns all games to @games" do
            get :index
            expect(assigns(:games).count).to eq(Game.all.count)
        end
    end

    describe "GET #show" do
        it "returns HTTP success" do
            get :show, params: { id: game.id }
            expect(response).to have_http_status(:success)
        end

        it "renders the #show view" do
            get :show, params: { id: game.id }
            expect(response).to render_template :show
        end

        it "assigns game to @game" do
            get :show, params: { id: game.id }
            expect(assigns(:game)).to eq(game)
        end

        it "assigns court to @court" do
            get :show, params: { id: game.id }
            expect(assigns(:court)).to eq(court)
        end

        it "assigns game.users to @players" do
            get :show, params: { id: game.id }
            expect(assigns(:players)).to eq(game.users)
        end
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

        it "initializes @game" do
            get :new
            expect(assigns(:game)).not_to be_nil
        end
    end

    describe "POST #create" do
        it "increases the number of games by 1" do
            expect { post :create, params: { game: {title: "Cool New Game", date: (DateTime.now + 1.month)}, court_id: court.id } }.to change(Game, :count).by(1)
        end

        it "assigns Game.last to @game" do
            post :create, params: { game: {title: "Cool New Game", date: (DateTime.now + 1.month)}, court_id: court.id }
            expect(assigns(:game)).to eq(Game.last)
        end

        it "redirects to the new game page" do
            post :create, params: { game: {title: "Cool New Game", date: (DateTime.now + 1.month)}, court_id: court.id }
            expect(response).to redirect_to Game.last
        end
    end

    describe "DELETE #destroy" do
        it "deletes the game" do
            delete :destroy, params: { id: game.id }
            count = Game.where({id: game.id}).size
            expect(count).to eq(0)
        end

        it "removes players from the game" do
            delete :destroy, params: { id: game.id }
            count = UserGame.where({id: game.id}).size
            expect(count).to eq(0)
        end

        it "redirects to the game index" do
            delete :destroy, params: { id: game.id }
            expect(response).to redirect_to games_path
        end
    end
end
