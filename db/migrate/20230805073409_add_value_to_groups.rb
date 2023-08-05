class AddValueToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :value, :decimal, default: 0.0
  end
end
