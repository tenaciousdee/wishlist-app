class List < ActiveRecord::Base
  belongs_to :user
  has_many :added_products
  has_many :products, through: :added_products
end