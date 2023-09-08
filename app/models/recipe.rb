class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

  def public?
    public == true
  end

  def total_price
    recipe_foods.sum { |recipe_food| recipe_food.quantity * recipe_food.food.price }
  end
end
