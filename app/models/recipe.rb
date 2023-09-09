class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, ->{includes (:food) }, dependent: :destroy
  has_many :foods, through: :recipe_foods

  validates :name, presence: true
  validates :description, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  

  def public?
    public == true
  end

  def total_price
    recipe_foods.sum { |recipe_food| recipe_food.quantity * recipe_food.food.price }
  end

end
