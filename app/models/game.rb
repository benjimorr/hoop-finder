class Game < ApplicationRecord
    belongs_to :court
    belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'

    has_and_belongs_to_many :users

    validates :title, presence: true, length: { minimum: 5 }
    validates :date, presence: true
    validates :court, presence: true
    validates :creator_id, presence: true
end
