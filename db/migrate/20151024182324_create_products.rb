class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :price
      t.text :image_link
      t.text :dimensions
      t.float :height
      t.float :width

      t.timestamps null: false
    end
  end
end
