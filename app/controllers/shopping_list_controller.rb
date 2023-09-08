class ShoppingListController < ApplicationController

  def index
    @recipes = Recipe.where(user_id: current_user.id)
    @foods = Food.where(user_id: current_user.id)
    @recipe_foods = RecipeFood.all

    @hash_foods={}

    @food_to_buy = []
    
    
    @foods.each do |food|
      @hash_foods[food.name]= [ food.quantity,food.measurement_unit,food.price,0.0]
    end

    @recipes.each do |recipe|

      recipe_foods = RecipeFood.where(recipe_id: recipe.id)
      recipe_foods.each do |recipe_food|
        food =@foods.find(recipe_food.food_id)
        @hash_foods[food.name][3] = @hash_foods[food.name][3] + recipe_food.quantity 
      end    

    end
   
    @hash_foods.each do |ele|
      
        if( ele[1][3] > ele[1][0] )
            @food_to_buy.push( [ele[0],ele[1][3]-ele[1][0],ele[1][1],ele[1][2] ])
        end
    
    end 
    

  end 

end
