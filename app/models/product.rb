class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :list
  has_many :added_products
  mount_uploader :image, ImageUploader
end
