class List < ActiveRecord::Base
  belongs_to :user
  has_many :products

  def set_user!(user)
    self.user_id = user.id

    self.save!
  end
end