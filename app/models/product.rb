class Product < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :group_products, dependent: :destroy
  has_many :groups, through: :group_products, dependent: :destroy

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :author_id, presence: true
  validates :group_id, presence: true

  before_destroy :destroy_associated_group_products

  private

  def destroy_associated_group_products
    group_products.destroy_all
  end
end
