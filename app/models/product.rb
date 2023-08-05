class Product < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :group_products
  has_many :groups, through: :group_products

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  
end
