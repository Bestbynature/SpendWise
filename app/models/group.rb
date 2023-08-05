class Group < ApplicationRecord
  belongs_to :user
  has_many :group_products, dependent: :destroy
  has_many :products, through: :group_products, dependent: :destroy

  after_create :update_value

  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :icon, presence: true

  def update_value
    self.value = products.sum(:amount)
    save
  end
end
