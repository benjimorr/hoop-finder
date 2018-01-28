class UserGame < ApplicationRecord
    belongs_to :user
    belongs_to :game

    scope :creator, -> {
        where(creator: true)
    }
end
