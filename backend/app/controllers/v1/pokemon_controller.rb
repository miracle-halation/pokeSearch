class V1::PokemonController < ApplicationController
	def index
		@pokemons = Pokemon.all
		render json: { pokemons: @pokemons }, status: :ok
	end

	def show
		@pokemon = Pokemon.find(params[:id])
		render json: { pokemon: @pokemon }, status: :ok
	end

	def create
		@pokemon = Pokemon.new(pokemon_params)
		if @pokemon.save
			render json: { message: 'Successfully created', pokemon: @pokemon }, status: :ok
		else
			render json: { message: 'Failed to create Pokemon.' }, status: :unprocessable_entity
		end
	end

	def update
		@pokemon = Pokemon.find(params[:id])
		if @pokemon.update(pokemon_params)
			render json: { message: 'Successfully updated', pokemon: @pokemon }, status: :ok
		else
			render json: { message: 'Failed to update Pokemon.' }, status: :unprocessable_entity
		end
	end

	def destroy
		@pokemon = Pokemon.find(params[:id])
		if @pokemon.destroy
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
