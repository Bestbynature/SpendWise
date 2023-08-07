class Group < ApplicationRecord
  belongs_to :user
  has_many :group_products, dependent: :destroy
  has_many :products, through: :group_products, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :icon, presence: true

  before_destroy :destroy_associated_group_products

  private

  def destroy_associated_group_products
    group_products.destroy_all
  end
end
