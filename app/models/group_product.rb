class GroupProduct < ApplicationRecord
  belongs_to :group
  belongs_to :product
end
