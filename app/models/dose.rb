class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  validates :ingredient_id, uniqueness: { scope: :cocktail_id, message: 'ingredient should be used once per cocktail' }
end
