class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail

  validates :cocktail_id, uniqueness: {scope: :ingredient_id}
  validates :description, presence: true
  validates :ingredient, presence: true
  validates :cocktail, presence: true
end
