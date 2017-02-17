class Cocktail < ApplicationRecord
  has_many :ingredients, dependent: :destroy

  validates :name, uniqueness: true, presence: true
end
