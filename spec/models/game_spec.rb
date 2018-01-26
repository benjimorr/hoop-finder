require 'rails_helper'

RSpec.describe Game, type: :model do
    let(:user) { create(:user) }
    let(:court) { create(:court) }
    let(:game) { create(:game, court: court) }

    # Shoulda tests
    it { is_expected.to belong_to(:court) }
    it { is_expected.to have_many(:users) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(5) }
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:court) }

    describe "attributes" do
        it "has title and date attributes" do
            expect(game).to have_attributes(title: game.title, date: game.date)
        end
    end

    describe "associations" do
        let(:user_creator) { UserGame.create(user: user, game: game, creator: true) }

        it "has a game creator" do
            user_creator.save!
            expect(game.users.merge(UserGame.creator).first).to eq(user)
        end
    end
end
