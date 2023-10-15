class Pokemon < ApplicationRecord
  has_many :pokemon_type
  has_many :types, through: :pokemon_type

  validates :name, presence: true, length: { maximum: 255 }
  validates :hp, :attack, :block, :contact, :diffence, :speed, presence: true, numericality: { only_integer: true }
  validates :avility1, presence: true, length: { maximum: 255 }
  validates :pokemon_id, presence: true, allow_blank: true
  validates :avility2, :hidden_avility, length: { maximum: 255 }

  def self.search(data)
    query = self.includes(:types)

    if data.present?
      name = data[:name]
      pokemon_id = data[:pokemon_id]
      type_name = data[:type_name]

      query = query.where(name: name) if name.present?
      query = query.where(pokemon_id: pokemon_id) if pokemon_id.present?
      query = query.where(types: {name: type_name})  if type_name.present?
    end

    query
  end
end
