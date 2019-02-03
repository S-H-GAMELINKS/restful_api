class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :making_time
      t.string :serves
      t.string :ingredients
      t.string :cost

      t.timestamps
    end
  end
end
