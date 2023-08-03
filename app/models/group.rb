class Group < ApplicationRecord
  belongs_to :user
  has_many :group_products
  has_many :products, through: :group_products
end
