require 'rails_helper'

RSpec.describe "V1::Pokemons", type: :request do
  describe 'GET #index' do
    it 'returns a list of pokemons' do
      # Pokemonモデルのテストデータを作成
      create_list(:pokemon, 3)

      get v1_pokemon_index_path

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['pokemons'].count).to eq(3)
    end
  end

  describe 'GET #show' do
    it 'returns a single pokemon' do
      # Pokemonモデルのテストデータを作成
      pokemon = create(:pokemon)

      get v1_pokemon_path(pokemon)

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['pokemon']['id']).to eq(pokemon.id)
    end
  end

  describe 'POST #create' do
    context 'with valid data' do
      it 'creates a new pokemon' do
        valid_params = { pokemon: { name: 'Pikachu', hp: 100, attack: 50, block: 30, contact: 40, diffence: 35, speed: 60, type1: 'Electric', avility1: 'Static' } }

        post v1_pokemon_index_path, params: valid_params

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['message']).to eq('Successfully created')
        expect(Pokemon.count).to eq(1)
      end
    end

    context 'with invalid data' do
      it 'fails to create a new pokemon' do
        invalid_params = { pokemon: { name: nil, hp: 100, attack: 50, block: 30, contact: 40, diffence: 35, speed: 60, type1: 'Electric', avility1: 'Static' } }

        post v1_pokemon_index_path, params: invalid_params

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['message']).to eq('Failed to create Pokemon.')
        expect(Pokemon.count).to eq(0) # ポケモンが作成されていないことを確認
      end
    end
  end

  describe 'PATCH #update' do
    let(:pokemon) { create(:pokemon) } # 事前にポケモンを作成する例

    context 'with valid data' do
      it 'updates the pokemon' do
        valid_params = { id: pokemon.id, pokemon: { name: 'Pikachu' } }

        patch v1_pokemon_path(pokemon), params: valid_params

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['message']).to eq('Successfully updated')
        expect(pokemon.reload.name).to eq('Pikachu')
      end
    end

    context 'with invalid data' do
      it 'fails to update the pokemon' do
        invalid_params = { id: pokemon.id, pokemon: { name: nil } }

        patch v1_pokemon_path(pokemon), params: invalid_params

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['message']).to eq('Failed to update Pokemon.')
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:pokemon) { create(:pokemon) } # 事前にポケモンを作成する例

    context 'when the pokemon exists' do
      it 'deletes the pokemon' do
        delete v1_pokemon_path(pokemon)

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['message']).to eq('Pokemon was successfully deleted.')
        expect(Pokemon.exists?(pokemon.id)).to be_falsey
      end
    end
  end
end
