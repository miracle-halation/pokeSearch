class Pokemon < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :hp, :attack, :block, :contact, :diffence, :speed, presence: true, numericality: { only_integer: true }
  validates :type1, :avility1, presence: true, length: { maximum: 255 }
  validates :pokemon_id, uniqueness: true, allow_blank: true
  validates :type2, :avility2, :hidden_avility, length: { maximum: 255 }
end
