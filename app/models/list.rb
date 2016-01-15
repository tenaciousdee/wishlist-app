class List < ActiveRecord::Base
  belongs_to :user
  has_many :products

  def set_user!(user)
    self.user_id = user.id

    self.save!
  end

  def product_categories
    categories = []
    List.all.each do |list|
      list.products.each do |product|
        categories << product.category
      end
    end
    categories.uniq
  end
end