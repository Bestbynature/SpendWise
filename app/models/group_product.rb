class GroupProduct < ApplicationRecord
  belongs_to :group
  belongs_to :product

  after_save :update_group_value
  after_destroy :update_group_value

  def update_group_value
    group.update_value
  end
end
