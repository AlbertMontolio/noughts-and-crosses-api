FactoryBot.define do
  factory :game, class: Game do
    creator { create(:creator) }
    joiner { create(:joiner) }
  end
end
