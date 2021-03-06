class List < ActiveRecord::Base
  belongs_to :user
  has_many :products

  def set_user!(user)
    self.user_id = user.id

    self.save!
  end

  def product_categories
    categories = []
    products.each do |product|
      categories << product.category
    end
    new_cats = categories.uniq.reject { |cat| cat.nil? || cat == '' }
    new_cats
  end
end