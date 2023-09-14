require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  let(:pokemon) { build(:pokemon) } # Pokemonオブジェクトを作成する例

  it 'is valid with valid attributes' do
    expect(pokemon).to be_valid
  end

  it 'validates presence of name' do
    pokemon.name = nil
    expect(pokemon).to_not be_valid
    expect(pokemon.errors[:name]).to include("can't be blank")
  end

  it 'validates maximum length of name' do
    pokemon.name = 'A' * 256
    expect(pokemon).to_not be_valid
    expect(pokemon.errors[:name]).to include('is too long (maximum is 255 characters)')
  end

  it 'validates uniqueness of pokemon_id' do
    existing_pokemon = create(:pokemon)
    pokemon.pokemon_id = existing_pokemon.pokemon_id
    expect(pokemon).to_not be_valid
    expect(pokemon.errors[:pokemon_id]).to include('has already been taken')
  end

  it 'allows blank pokemon_id' do
    pokemon.pokemon_id = ''
    expect(pokemon).to be_valid
  end

  it 'validates maximum length of type2' do
    pokemon.type2 = 'A' * 256
    expect(pokemon).to_not be_valid
    expect(pokemon.errors[:type2]).to include('is too long (maximum is 255 characters)')
  end
end
