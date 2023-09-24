class V1::SearchController < ApplicationController
	def search
		authorize Pokemon

    paged = params[:paged]
    per = params[:per].present? ? params[:per] : 10
    @pokemons = PokemonService.all_pokemons(pokemon_params)
    @pokemon_paginatied = @pokemons.page(paged).per(per)
    render json: { pokemons: @pokemon_paginatied }, status: :ok
	end

	private
	def pokemon_params
    params.require(:pokemon).permit(:pokemon_id, :name)
  end
end
