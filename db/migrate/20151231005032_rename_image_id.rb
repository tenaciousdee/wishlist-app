class RenameImageId < ActiveRecord::Migration
  def change
    rename_column :products, :image_url, :image_src
  end
end
