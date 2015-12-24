class CreateAddedProducts < ActiveRecord::Migration
  def change
    create_table :added_products do |t|
      t.integer :product_id
      t.integer :list_id

      t.timestamps null: false
    end
  end
end
