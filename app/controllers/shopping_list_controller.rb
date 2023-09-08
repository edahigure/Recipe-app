class ShoppingListController < ApplicationController

  def index
    @recipes = Recipe.where(user_id: current_user.id)
    @foods = Food.where(user_id: current_user.id)
    @recipe_foods = RecipeFood.all

    @hash_foods={}
    
    @foods.each do |food|
      @hash_foods[food.name]= food.quantity
    end
    


    @recipes.each do |recipe|

      recipe_foods = RecipeFood.where(recipe_id: recipe.id)
      recipe_foods.each do |recipe_food|
        food =@foods.find(recipe_food.food_id)
        @hash_foods[food.name] = @hash_foods[food.name] - recipe_food.quantity
      end



    end

    

    

  end 

end
