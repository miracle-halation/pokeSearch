class PokemonService
  def self.all_pokemons
    Pokemon.all
  end

  def self.find_pokemon(id)
    Pokemon.find(id)
  end

  def self.create_pokemon(params)
    Pokemon.create(params)
  end

  def self.update_pokemon(pokemon, params)
    pokemon.update(params)
  end

  def self.delete_pokemon(pokemon)
    pokemon.destroy
  end
end
