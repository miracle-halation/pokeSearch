class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string    :pokemon_id
      t.string    :name, null: false, limit: 255
      t.integer   :hp, null: false
      t.integer   :attack, null: false
      t.integer   :block, null: false
      t.integer   :contact, null: false
      t.integer   :diffence, null: false
      t.integer   :speed, null: false
      t.string    :avility1, null: false, limit: 255
      t.string    :avility2, limit: 255
      t.string    :hidden_avility, limit: 255
      t.timestamps
    end
  end
end
