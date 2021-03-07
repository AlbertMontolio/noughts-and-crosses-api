FactoryBot.define do
  factory :move, class: Move do
    user
    game
    pos_x { 0 }
    pos_y { 0 }
  end
end
