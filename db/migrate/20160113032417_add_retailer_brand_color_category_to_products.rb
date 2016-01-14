class AddRetailerBrandColorCategoryToProducts < ActiveRecord::Migration
  def change
    add_column :products, :retailer, :string
    add_column :products, :brand, :string
    add_column :products, :color, :string
    add_column :products, :category, :string
  end
end
