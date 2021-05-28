class CreateCordinates < ActiveRecord::Migration[6.1]
  def change
    create_table :cordinates do |t|
      t.string :title
      t.string :tops
      t.string :bottoms
      t.string :shoes
      t.string :bag
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
