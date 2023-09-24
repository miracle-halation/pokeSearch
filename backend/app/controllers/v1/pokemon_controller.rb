class V1::PokemonController < ApplicationController
  include Pagination

  def index
    authorize Pokemon

    paged = params[:paged]
    per = params[:per].present? ? params[:per] : 10
    @pokemons = PokemonService.all_pokemons(params[:query])
    @pokemon_paginatied = @pokemons.page(paged).per(per)
    render json: { pokemons: @pokemon_paginatied }, status: :ok
  end

  def show
    authorize Pokemon

    @pokemon = PokemonService.find_pokemon(params[:id])
    render json: { pokemon: @pokemon }, status: :ok
  end

  def create
    authorize Pokemon

    @pokemon = PokemonService.create_pokemon(pokemon_params)
    if @pokemon.persisted?
      render json: { message: 'Successfully created', pokemon: @pokemon }, status: :ok
    else
      render json: { message: 'Failed to create Pokemon.' }, status: :unprocessable_entity
    end
  end

  def update
    authorize Pokemon

    @pokemon = PokemonService.find_pokemon(params[:id])
    if PokemonService.update_pokemon(@pokemon, pokemon_params)
      render json: { message: 'Successfully updated', pokemon: @pokemon }, status: :ok
    else
      render json: { message: 'Failed to update Pokemon.' }, status: :unprocessable_entity
    end
  end

  def destroy
    authorize Pokemon

    @pokemon = PokemonService.find_pokemon(params[:id])
    if PokemonService.delete_pokemon(@pokemon)
      render json: { message: 'Pokemon was successfully deleted.' }, status: :ok
    else
      render json: { message: 'Failed to delete Pokemon.' }, status: :unprocessable_entity
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:pokemon_id, :name, :hp, :attack, :block, :contact, :diffence, :speed, :type1, :type2, :avility1, :avility2, :hidden_avility)
  end
end
