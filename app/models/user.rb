class User < ApplicationRecord
    has_many :games_created, :class_name => 'Game', :foreign_key => 'creator_id', dependent: :destroy
    has_and_belongs_to_many :games

    after_initialize { self.skill_level ||= :beginner }

    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
    validates :email, length: { minimum: 3, maximum: 254 }
    validates :first_name, presence: true, length: { minimum: 2, maximum: 50 }
    validates :last_name, presence: true, length: { minimum: 2, maximum: 50 }
    validates :username, presence: true, length: { minimum: 5 }
    validates :skill_level, presence: true

    enum skill_level: [:beginner, :intermediate, :advanced, :legendary]
end
