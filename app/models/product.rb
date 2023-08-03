class Product < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :group_products
  has_many :groups, through: :group_products
end
