FactoryBot.define do
  factory :pokemon do
    pokemon_id { Faker::Number.number(digits: 5) }
    name { Faker::Name.unique.name }
    hp { Faker::Number.between(from: 1, to: 100) }
    attack { Faker::Number.between(from: 1, to: 100) }
    block { Faker::Number.between(from: 1, to: 100) }
    contact { Faker::Number.between(from: 1, to: 100) }
    diffence { Faker::Number.between(from: 1, to: 100) }
    speed { Faker::Number.between(from: 1, to: 100) }
    type1 { Faker::Lorem.word }
    type2 { Faker::Lorem.word }
    avility1 { Faker::Lorem.word }
    avility2 { Faker::Lorem.word }
    hidden_avility { Faker::Lorem.word }
  end
end
