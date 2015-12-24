class Product < ActiveRecord::Base
  belongs_to :user
  has_many :added_products
  has_many :lists, through: :added_products
  mount_uploader :image, ImageUploader
end
