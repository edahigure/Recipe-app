class Food < ApplicationRecord
  belongs_to :user

  has_many :food_categories, dependent: :destroy
end
