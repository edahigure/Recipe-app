class Food < ApplicationRecord
  belongs_to :user

  has_many :recipe_foods, dependent: :destroy
  # has_many :foods_to_buy, -> { }

  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true
  validates :quantity, presence: true

  def to_buy
    return unless recipe_foods.any?

    (recipe_foods.sum(&:quantity) - quantity)
  end
end
