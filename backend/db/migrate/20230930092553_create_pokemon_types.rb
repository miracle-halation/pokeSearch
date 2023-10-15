class CreatePokemonTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemon_types do |t|
      t.references :pokemon, foreign_key: true
      t.references :type, foreign_key: true
      t.timestamps
    end
  end
end
