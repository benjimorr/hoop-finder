class Game < ApplicationRecord
    has_many :user_games, dependent: :destroy
    has_many :users, through: :user_games
    belongs_to :court

    validates :title, presence: true, length: { minimum: 5 }
    validates :date, presence: true
    validates :court, presence: true
end
