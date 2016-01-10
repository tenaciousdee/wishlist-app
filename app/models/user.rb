class User < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :products
  has_many :lists
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
