class Food < ApplicationRecord
  belongs_to :user

  has_many :recipe_foods, dependent: :destroy
  # has_many :foods_to_buy, -> { }

  def to_buy
    return unless recipe_foods.any?

    (recipe_foods.sum(&:quantity) - quantity)
  end
end
