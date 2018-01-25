require 'rails_helper'

RSpec.describe Game, type: :model do
    let(:user) { create(:user) }
    let(:court) { create(:court) }
    let(:game) { create(:game, creator: user, court: court) }

    # Shoulda tests
    it { is_expected.to have_and_belong_to_many(:users) }
    it { is_expected.to belong_to(:court) }
    it { is_expected.to belong_to(:creator) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(5) }
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:court) }
    it { is_expected.to validate_presence_of(:creator_id) }

    describe "attributes" do
        it "has title and date attributes" do
            expect(game).to have_attributes(title: game.title, date: game.date)
        end

        it "responds to users" do
            expect(game).to respond_to(:users)
        end
    end
end
