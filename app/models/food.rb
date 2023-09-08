class Food < ApplicationRecord
  belongs_to :user

  has_many :recipe_foods, dependent: :destroy
  #has_many :foods_to_buy, -> { }

  def to_buy
    if recipe_foods.any?
      (recipe_foods.sum { |rf| rf.quantity } - quantity)
    end
  end

end
