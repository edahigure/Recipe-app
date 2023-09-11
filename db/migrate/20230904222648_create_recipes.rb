class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.string :preparation_time, null: false
      t.string :cooking_time, null: false
      t.text :description
      t.boolean :public
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
