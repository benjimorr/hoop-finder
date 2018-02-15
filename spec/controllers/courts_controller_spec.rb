require 'rails_helper'

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
        it "returns http success" do
            post :create
            expect(response).to have_http_status(:success)
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
