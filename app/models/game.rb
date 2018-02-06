class Game < ApplicationRecord
    has_many :user_games, dependent: :destroy
    has_many :users, through: :user_games
    belongs_to :court

    validates :title, presence: true, length: { minimum: 5 }
    validates :date, presence: true
    validates :court, presence: true

    # Scopes for Game index view
    scope :upcoming_games, -> { where('date >= ?', Time.now) }
    scope :my_games, lambda { |user| joins(:user_games).where(["user_games.user_id = ? and games.date >= ?", user, Time.now]) }
    scope :past_games, lambda { |user| joins(:user_games).where(["user_games.user_id = ? and games.date < ?", user, Time.now]) }
end
