class Type < ApplicationRecord
	has_many :pokemon_type
  has_many :pokemons, through: :pokemon_type
end
