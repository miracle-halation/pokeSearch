class V1::PokemonController < ApplicationController
  def index
    @pokemons = PokemonService.all_pokemons
    render json: { pokemons: @pokemons }, status: :ok
  end

  def show
    @pokemon = PokemonService.find_pokemon(params[:id])
    render json: { pokemon: @pokemon }, status: :ok
  end

  def create
    @pokemon = PokemonService.create_pokemon(pokemon_params)
    if @pokemon.persisted?
      render json: { message: 'Successfully created', pokemon: @pokemon }, status: :ok
    else
      render json: { message: 'Failed to create Pokemon.' }, status: :unprocessable_entity
    end
  end

  def update
    @pokemon = PokemonService.find_pokemon(params[:id])
    if PokemonService.update_pokemon(@pokemon, pokemon_params)
      render json: { message: 'Successfully updated', pokemon: @pokemon }, status: :ok
    else
      render json: { message: 'Failed to update Pokemon.' }, status: :unprocessable_entity
    end
  end

  def destroy
    @pokemon = PokemonService.find_pokemon(params[:id])
    if PokemonService.delete_pokemon(@pokemon)
      render json: { message: 'Pokemon was successfully deleted.' }, status: :ok
    else
      render json: { message: 'Failed to delete Pokemon.' }, status: :unprocessable_entity
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :hp, :attack, :block, :contact, :diffence, :speed, :type1, :type2, :avility1, :avility2, :hidden_avility)
  end
end