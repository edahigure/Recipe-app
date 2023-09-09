class ShoppingListController < ApplicationController
  def index
    @foods = current_user.foods.includes(:recipe_foods)
    @foods_to_buy = @foods.select { |food| !food.to_buy.nil? && food.to_buy.positive? }
    @total_value = @foods_to_buy.sum { |food| food.to_buy * food.price }
  end

  def shopping_list_params
    params.require(:shopping_list).permit(:recipe_id)
  end
end
