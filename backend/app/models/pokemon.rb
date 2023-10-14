class Pokemon < ApplicationRecord
  has_many :pokemon_type
  has_many :types, through: :pokemon_type

  validates :name, presence: true, length: { maximum: 255 }
  validates :hp, :attack, :block, :contact, :diffence, :speed, presence: true, numericality: { only_integer: true }
  validates :type1, :avility1, presence: true, length: { maximum: 255 }
  validates :pokemon_id, uniqueness: true, allow_blank: true
  validates :type2, :avility2, :hidden_avility, length: { maximum: 255 }

  def self.search(data)
    query = self.all

    if data.present?
      name = data[:name]
      pokemon_id = data[:pokemon_id]

      query = query.where(name: name) if name.present?
      query = query.where(pokemon_id: pokemon_id) if pokemon_id.present?
    end

    query
  end
end
