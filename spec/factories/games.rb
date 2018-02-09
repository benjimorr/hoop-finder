require 'date'

FactoryBot.define do
  factory :game do
    title "Best Pickup Basketball Game"
    date DateTime.now + 1.month
    court
  end
end
