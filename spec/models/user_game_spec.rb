require 'rails_helper'

RSpec.describe UserGame, type: :model do
    let(:user) { create(:user) }
    let(:court) { create(:court) }
    let(:game) { create(:game, court: court) }
    let(:user_game) { UserGame.create!(user: user, game: game) }

    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:game) }
end
